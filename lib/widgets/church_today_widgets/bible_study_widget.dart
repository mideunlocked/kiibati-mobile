import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../models/bible_study.dart';
import '../bible_study/bible_study_app_bar.dart';
import '../bible_study/bible_study_body.dart';

class BibleStudySheet extends StatefulWidget {
  const BibleStudySheet({
    super.key,
    required this.bibleStudy,
  });

  final BibleStudy bibleStudy;

  @override
  State<BibleStudySheet> createState() => _BibleStudySheetState();
}

class _BibleStudySheetState extends State<BibleStudySheet>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // listen to state: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      }
    });

    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    // listen to audio position change
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return WillPopScope(
      onWillPop: () async {
        audioPlayer.stop();
        Navigator.pop(context);
        throw 0;
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Stack(
          children: [
            BibleStudyBody(
              widget: widget,
            ),
            BibleStudyAppBar(audioPlayer: audioPlayer),
          ],
        ),
      ),
    );
  }
}
