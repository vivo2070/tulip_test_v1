import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.tulipm.net/Uplouds/Video/Video-91f8a56a-022b-4c35-911d-2042c3b22256.MP4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMiddleAvatar() {
    return GestureDetector(
      onTap: () {
        _controller.play();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  _controller.pause();
                  Navigator.pop(context);
                },
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController: _controller,
                    aspectRatio: 16 / 9,
                    autoInitialize: true,
                    looping: true,
                    showControls: false,
                    allowFullScreen: true,
                    fullScreenByDefault: true,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('images/logo.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: _buildMiddleAvatar(),
        ),
      ),
    );
  }
}
