import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class SermonVideoPlayer extends StatelessWidget {
  const SermonVideoPlayer({
    super.key,
    required this.videoController,
  });

  final VideoPlayerController? videoController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.h,
      ),
      child: SizedBox(
        height: 30.h,
        child: VideoPlayer(
          videoController ?? VideoPlayerController.asset(""),
        ),
      ),
    );
  }
}
