import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../data.dart';
import '../widgets/sermon-widgets/increase_decrease_button.dart';
import '../widgets/sermon-widgets/sermon_app_bar.dart';
import '../widgets/sermon-widgets/sermon_by_widget.dart';
import '../widgets/sermon-widgets/sermon_reference_widget.dart';
import '../widgets/sermon-widgets/sermon_text_widget.dart';
import '../widgets/sermon-widgets/sermon_title_widget.dart';
import '../widgets/sermon-widgets/sermon_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double textSize = 12.sp;

  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.networkUrl(Uri.parse(
        "https://player.vimeo.com/external/529325915.sd.mp4?s=ec013d6b805bd9468abeec747119d5ab275ca589&profile_id=164&oauth2_token_id=57447761"))
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
    var textTheme = of.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 3.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App bar
                  SermonAppBar(textTheme: textTheme),

                  // sermon video space
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32.h,
                          ),

                          // sermon title
                          SermonTitleWidget(textTheme: textTheme),

                          // sermon reference
                          const SermonReferenceWidget(),

                          // sermon by
                          const SermonByWidget(),

                          // sermon text widget
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                            ),
                            child: Column(
                              children: sermonData
                                  .map(
                                    (e) => SermonTextWidget(
                                      textSize: textSize,
                                      data: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // sermon video player
            SermonVideoPlayer(videoController: videoController),
          ],
        ),
      ),

      // floating action widget 2 one for increment and decrement
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // increment floating action button
          IncreaseDecreaseButton(
            function: () => increaseText(),
            icon: Icons.keyboard_arrow_up_rounded,
          ),

          SizedBox(
            height: 1.h,
          ),

          // decrement floating action button
          IncreaseDecreaseButton(
            function: () => decreaseText(),
            icon: Icons.keyboard_arrow_down_rounded,
          ),
        ],
      ),
    );
  }

  // increment function
  void increaseText() {
    setState(() {
      textSize = textSize + 1;
    });
  }

  // decrement function
  void decreaseText() {
    setState(() {
      textSize = textSize - 1;
    });
  }
}
