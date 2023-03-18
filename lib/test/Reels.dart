import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuliptest/test/playStory.dart';
import 'package:video_player/video_player.dart';

abstract class ReelEvent {}

class FetchReelsEvent extends ReelEvent {}

abstract class ReelState {}

class InitialState extends ReelState {}

class LoadingState extends ReelState {}

class LoadedState extends ReelState {
  final List<Reel> reels;

  LoadedState({required this.reels});
}

class ErrorState extends ReelState {}


class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final String apiUrl = 'https://www.tulipm.net/api/Reels/GetAll';

  ReelBloc() : super(InitialState());

  @override
  Stream<ReelState> mapEventToState(ReelEvent event) async* {
    if (event is FetchReelsEvent) {
      yield LoadingState();

      try {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body) as Map<String, dynamic>;
          final reelJson = data['data'] as List<dynamic>;
          final reels = reelJson.map((json) => Reel.fromJson(json)).toList();
          yield LoadedState(reels: reels);
        } else {
          yield ErrorState();
        }
      } catch (_) {
        yield ErrorState();
      }
    }
  }
}


class Reel {
  String name;
  String imageUrl;
  String videoUrl;

  Reel({required this.name, required this.imageUrl, required this.videoUrl});

  final List<Reel> reels=[];

  factory Reel.fromJson(Map<String, dynamic> json) {
    return Reel(
      name: json['centerName'],
      imageUrl: json['image'],
      videoUrl: json['url']
    );
  }
}
class reelsList extends StatefulWidget {
  @override
  _reelsListState createState() => _reelsListState();
}

class _reelsListState extends State<reelsList> {
  Future<List<Reel>>? futureReel;
  List<Reel> reels = [];
  String? authToken;
  final ImagePicker _picker = ImagePicker();


  @override
  void initState() {
    super.initState();
    futureReel = fetchReels();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        authToken = prefs.getString('authToken');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Reel>>(
        future: futureReel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            reels = snapshot.data!;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: reels.length + (authToken != '' ? 1 : 0), // add 1 if user is authenticated
              itemBuilder: (context, index) {
                if (authToken != '' && index == 0) {
                  // add the "add" avatar at the beginning if user is authenticated
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            child: GestureDetector(
                              onTap: (){
                                pickVideo();
                                print('tap');
                              },
                              child: CircleAvatar(
                                radius: 33,
                                backgroundColor: Color(0xffEA6CB0),
                                child: Icon(Icons.add,size: 40,color: Colors.white,),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                } else {
                  final reel = reels[authToken != '' ? index - 1 : index]; // adjust index if user is authenticated
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoryVideoPlayer(
                                  avatarUrl: reel.imageUrl,
                                  name: reel.name,
                                  videoUrl: reel.videoUrl,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.pink,
                                width: 1.0,
                              ),
                            ),
                            child: Container(
                              child: CircleAvatar(
                                radius: 33,
                                child: ClipOval(
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/logo.png',
                                    image: reel.imageUrl,
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 90,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                        'images/logo.png',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 0,
                          right: 0,
                          child: Text(
                            reel.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );


  }
  Future<void> pickVideo() async {
    final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      // The user picked a video
      final File videoFile = File(pickedFile.path);
      // Upload the video file to your server here
    } else {
      // The user cancelled the picker
    }
  }
}




//
Future<List<Reel>> fetchReels() async {
  var apiUrl = 'https://www.tulipm.net/api/Reels/GetAll';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final reelJson = data['data'] as List<dynamic>;
    final reels = reelJson.map((json) => Reel.fromJson(json)).toList();
    return reels;
  } else {
    throw Exception('Failed to load services');
  }
}

