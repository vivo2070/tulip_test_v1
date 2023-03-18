import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:http/http.dart' as http;


class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({Key? key}) : super(key: key);

  @override
  State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  late VideoPlayerController controller;
  late Future<List<Reels>> futureReels;

  String videoUrl =
      'https://buketstorage.s3.sa-east-1.amazonaws.com/eb2f65b2-fa15-46c6-b0e4-780610687b6a.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(videoUrl);

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}

class Reels {
  final String url;
  final String image;
  final String centerName;

  Reels({
    required this.url,
    required this.image,
    required this.centerName
  });

  factory Reels.fromJson(Map<String, dynamic> json) {
    return Reels(
      url: json['url'],
      image: json['image'],
      centerName: json['centerName']
    );
  }
}


Future<List<Reels>> fetchReels() async {
  final response = await http.get(Uri.parse('https://www.tulipm.net/api/Services/GetAll'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final ReelJson = data['data'] as List<dynamic>;
    final reels = ReelJson.map((json) => Reels.fromJson(json)).toList();
    return reels;
  } else {
    throw Exception('Failed to load services');
  }
}