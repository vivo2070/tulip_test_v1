import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../Widgets/bottomReel.dart';
import '../Widgets/reelIcon.dart';

class StoryVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String avatarUrl;
  final String name;

  StoryVideoPlayer(
      {required this.videoUrl, required this.avatarUrl, required this.name});

  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;



  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.play(); // play the video here
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void playNewVideo(String url) async {
    await _videoPlayerController.pause();
    await _videoPlayerController.initialize();
    setState(() {
      _initializeVideoPlayerFuture = _videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: bottomReel(),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return VideoPlayer(_videoPlayerController);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.grey,
                      ),
                    );
                  }
                },
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Align(
                heightFactor: 4,
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: reelsIcon(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'حجز موعد',
                          style: GoogleFonts.almarai(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    width: 240,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffBE338E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
