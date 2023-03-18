import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TikTokView extends StatefulWidget {
  const TikTokView({Key? key}) : super(key: key);

  @override
  _TikTokViewState createState() => _TikTokViewState();
}

class _TikTokViewState extends State<TikTokView> {
  late PageController _pageController;
  VideoPlayerController _videoController = VideoPlayerController.asset('images/video.mp4');

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
          ),
        ],
      ),
    );
  }
}
