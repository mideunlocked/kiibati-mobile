import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/helpers/date_time_formatting.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../data.dart';
import '../widgets/sermon-widgets/sermon-audio-widgets/audio_player_widget.dart';
import '../widgets/sermon-widgets/sermon_app_bar.dart';
import '../widgets/sermon-widgets/sermon_by_widget.dart';
import '../widgets/sermon-widgets/sermon_reference_widget.dart';
import '../widgets/sermon-widgets/sermon_screen_floating_button_widget.dart';
import '../widgets/sermon-widgets/sermon_text_widget.dart';
import '../widgets/sermon-widgets/sermon_title_widget.dart';
import '../widgets/sermon-widgets/sermon-video-widgets/sermon_video_player.dart';
import '../widgets/sermon-widgets/sermon_type_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double textSize = 12.sp;
  bool isVideoAllowed = false;
  bool isAudioAllowed = false;

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    // listen to state: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position change
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    audioPlayer.dispose();
    videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var dateTimeFormatting = DateTimeFormatting();
    var dateTime = dateTimeFormatting.formatTimeDate(Timestamp.now());

    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;
        var sermonVideoPlayer = SermonVideoPlayer(
          videoController: videoController,
          isLandscape: isLandscape,
        );

        var primaryColor = of.primaryColor;
        return isLandscape
            ? sermonVideoPlayer
            : SafeArea(
                child: Stack(
                  alignment: Alignment.bottomCenter,
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

                          // sermon video
                          isVideoAllowed == false
                              ? const SizedBox()
                              : sermonVideoPlayer,

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // sermon title
                                  SermonTitleWidget(textTheme: textTheme),

                                  // sermon reference
                                  const SermonReferenceWidget(),

                                  // sermon by
                                  const SermonByWidget(),

                                  // sermon date and time
                                  Text(
                                    "On: ${dateTime[1]}",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 10.sp,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),

                                  // video and audio initiation and disposal buttons
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.h),
                                    child: Row(
                                      children: [
                                        SermonTypeButton(
                                          icon: isVideoAllowed == true
                                              ? Icons.tv_off_rounded
                                              : Icons.tv_rounded,
                                          label: isVideoAllowed == true
                                              ? "Close video"
                                              : "Watch video",
                                          function: () => videoFunction(),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SermonTypeButton(
                                          icon: Icons.multitrack_audio_rounded,
                                          iconColor: isAudioAllowed == true
                                              ? Colors.red
                                              : Colors.white,
                                          label: isAudioAllowed == true
                                              ? "Close audio"
                                              : "Listen to audio",
                                          function: () => audioFunction(),
                                        ),
                                      ],
                                    ),
                                  ),

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
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // sermon audio player
                    isAudioAllowed != true // check if audio player is allowed
                        ? const SizedBox()
                        : AudioPlayerWidget(
                            primaryColor: primaryColor,
                            audioPlayer: audioPlayer,
                            duration: duration,
                            position: position,
                            dateTimeFormatting: dateTimeFormatting,
                          ),
                  ],
                ),
              );
      }),

      // floating action widget 2 one for increment and decrement
      floatingActionButton: OrientationBuilder(builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return isLandscape
            ? const SizedBox()
            : SermonScreenFloatingActionButtons(
                increaseText: () => increaseText(),
                decreaseText: () => decreaseText(),
                padding: isAudioAllowed == true ? 8.h : 0,
              );
      }),
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

  void videoFunction() {
    if (isVideoAllowed == true) {
      videoController?.dispose();
      setState(() {
        isVideoAllowed = false;
      });
    } else {
      setState(() {
        isAudioAllowed = false;
        audioPlayer.stop();
        videoController = VideoPlayerController.networkUrl(Uri.parse(
            "https://player.vimeo.com/external/529325915.sd.mp4?s=ec013d6b805bd9468abeec747119d5ab275ca589&profile_id=164&oauth2_token_id=57447761"))
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => videoController!.play());
        isVideoAllowed = true;
      });
    }
  }

  void audioFunction() async {
    if (isAudioAllowed == true) {
      setState(() {
        audioPlayer.stop();
        isAudioAllowed = false;
      });
    } else {
      await audioPlayer.play(AssetSource("audio/Inspiring-Dreams.mp3"));

      setState(() {
        isVideoAllowed = false;
        isAudioAllowed = true;
      });
    }
  }
}
