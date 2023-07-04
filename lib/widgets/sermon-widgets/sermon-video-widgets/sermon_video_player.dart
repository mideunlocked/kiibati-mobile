import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import 'video_loading_indicator.dart';

class SermonVideoPlayer extends StatefulWidget {
  const SermonVideoPlayer({
    super.key,
    required this.videoController,
    required this.isLandscape,
  });

  final VideoPlayerController? videoController;
  final bool isLandscape;

  @override
  State<SermonVideoPlayer> createState() => _SermonVideoPlayerState();
}

class _SermonVideoPlayerState extends State<SermonVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.isLandscape ? 0 : 2.h,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          widget.isLandscape ? 0 : 30,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // video player main widget
            SizedBox(
              height: widget.isLandscape ? 100.h : 30.h,
              child: VideoPlayer(
                widget.videoController ?? VideoPlayerController.asset(""),
              ),
            ),

            // video player pause/play widget and progress indicator
            SizedBox(
              width: widget.isLandscape ? 95.w : 85.w,
              child: Row(
                children: [
                  // pause and play widget
                  InkWell(
                    onTap: () {
                      widget.videoController!.value.isPlaying
                          ? widget.videoController!.pause()
                          : widget.videoController?.play();
                    },
                    child: Icon(
                      widget.videoController!.value.isPlaying
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill_rounded,
                      color: Colors.white38,
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),

                  // video player progress inidicator
                  Flexible(
                    child: VideoProgressIndicator(
                      widget.videoController ?? VideoPlayerController.asset(""),
                      colors: VideoProgressColors(
                        playedColor: primaryColor,
                      ),
                      allowScrubbing: true,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.sp,
                        horizontal: 2.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // circular progress inidicator which is stacked and aligned to the center
            if (widget.videoController != null &&
                widget.videoController!.value.isInitialized &&
                widget.videoController!.value.isBuffering == true)
              const VideoLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
