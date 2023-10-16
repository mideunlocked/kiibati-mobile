import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/date_time_formatting.dart';
import '../sermon-widgets/sermon-audio-widgets/audio_time_widget.dart';

class BibleStudyAudioWidget extends StatefulWidget {
  const BibleStudyAudioWidget({
    super.key,
    required this.controller,
    required this.audioPlayer,
    required this.duration,
    required this.position,
    required this.audioLink,
  });

  final AnimationController controller;
  final AudioPlayer audioPlayer;
  final Duration duration;
  final Duration position;
  final String audioLink;

  @override
  State<BibleStudyAudioWidget> createState() => _BibleStudyAudioWidgetState();
}

class _BibleStudyAudioWidgetState extends State<BibleStudyAudioWidget> {
  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var dateTimeFormatting = DateTimeFormatting();

    return Positioned(
      top: 80.h,
      child: Container(
        height: 20.h,
        width: 100.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
                right: 5.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // current position of the audio
                  AudioTime(
                    time: dateTimeFormatting.formatTime(widget.position),
                  ),

                  // pause/play widget
                  GestureDetector(
                    onTap: () {
                      if (widget.audioPlayer.state != PlayerState.playing &&
                          widget.audioPlayer.state != PlayerState.paused) {
                        audioFunction();
                        widget.controller.reverse();
                      }

                      if (widget.audioPlayer.state == PlayerState.playing) {
                        widget.audioPlayer.pause(); // pause audio player
                        widget.controller.reverse();
                      } else {
                        widget.audioPlayer.resume(); // play audio player
                        widget.controller.forward();
                      }
                    },

                    // audio player icons
                    child: LottieBuilder.asset(
                      "assets/lottie/pause_play.json",
                      controller: widget.controller,
                      height: 3.h,
                      width: 3.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // remianing time for the audio
                  AudioTime(
                    time: dateTimeFormatting
                        .formatTime(widget.duration - widget.position),
                  ),
                ],
              ),
            ),

            // slider for audio player
            Slider(
              min: 0,
              max: widget.duration.inSeconds.toDouble(),
              thumbColor: primaryColor,
              activeColor: Colors.white,
              inactiveColor: Colors.white30,
              value: widget.position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await widget.audioPlayer
                    .seek(position); // to seek a specific time on the audio

                widget.controller.forward();
                // resume audio if it was pasued
                await widget.audioPlayer.resume();
              },
            ),
          ],
        ),
      ),
    );
  }

  // audio function
  void audioFunction() async {
    await widget.audioPlayer.play(UrlSource(widget.audioLink));
  }
}
