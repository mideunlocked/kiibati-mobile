import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custome_back_button.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../widgets/sermon-widgets/sermon-video-widgets/video_loading_indicator.dart';

class ChoirMinistrationScreen extends StatefulWidget {
  const ChoirMinistrationScreen({super.key});

  @override
  State<ChoirMinistrationScreen> createState() =>
      _ChoirMinistrationScreenState();
}

class _ChoirMinistrationScreenState extends State<ChoirMinistrationScreen> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://player.vimeo.com/external/537269866.sd.mp4?s=93d4381e3e1222f48868dcad45de5a11b8e83f99&profile_id=164&oauth2_token_id=57447761",
      ),
    )
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController!.play());
  }

  @override
  void dispose() {
    super.dispose();

    videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var textTheme = of.textTheme;
    var titleMedium = textTheme.titleMedium;

    return OrientationBuilder(builder: (context, orientation) {
      var isLandscape = orientation == Orientation.landscape;

      return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: isLandscape == true
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
                leading: const CustomBackButton(
                  iconColor: Colors.white,
                ),
                title: const Text("Last sunday choir ministration"),
                titleTextStyle: titleMedium,
              ),
        body: SafeArea(
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // video player main widget
                Container(
                  color: Colors.white30,
                  height: isLandscape ? 100.h : 30.h,
                  child: VideoPlayer(
                    videoController ?? VideoPlayerController.asset(""),
                  ),
                ),

                // video player pause/play widget and progress indicator
                SizedBox(
                  width: isLandscape ? 95.w : 85.w,
                  child: Row(
                    children: [
                      // pause and play widget
                      InkWell(
                        onTap: () {
                          videoController!.value.isPlaying
                              ? videoController!.pause()
                              : videoController?.play();
                        },
                        child: Icon(
                          videoController!.value.isPlaying
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
                          videoController ?? VideoPlayerController.asset(""),
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
                if (videoController != null &&
                    videoController!.value.isInitialized &&
                    videoController!.value.isBuffering == true)
                  const VideoLoadingIndicator(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
