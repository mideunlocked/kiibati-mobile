import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/date_time_formatting.dart';
import 'audio_time_widget.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({
    super.key,
    required this.primaryColor,
    required this.audioPlayer,
    required this.duration,
    required this.position,
    required this.dateTimeFormatting,
  });

  final Color primaryColor;
  final AudioPlayer audioPlayer;
  final Duration duration;
  final Duration position;
  final DateTimeFormatting dateTimeFormatting;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 90.w,
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0.5,
        horizontal: 2.w,
      ),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // pause/play widget
          InkWell(
            onTap: () {
              if (audioPlayer.state == PlayerState.playing) {
                audioPlayer.pause(); // pause audio player
              } else {
                audioPlayer.resume(); // play audio player
              }
            },

            // audio player icons
            child: Icon(
              audioPlayer.state == PlayerState.playing
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              size: 20.sp,
            ),
          ),

          // audio player indicator (slider)
          Flexible(
            child: Stack(
              children: [
                // slider for audio player
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  thumbColor: primaryColor,
                  activeColor: primaryColor,
                  inactiveColor: Colors.white30,
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer
                        .seek(position); // to seek a specific time on the audio

                    // resume audio if it was pasued
                    await audioPlayer.resume();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                    left: 5.w,
                    right: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // current position of the audio
                      AudioTime(
                        time: dateTimeFormatting.formatTime(position),
                      ),

                      // remianing time for the audio
                      AudioTime(
                        time:
                            dateTimeFormatting.formatTime(duration - position),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
