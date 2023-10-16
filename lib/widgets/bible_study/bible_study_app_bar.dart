import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../general-widgets/bottom_sheet_app_bar.dart';

class BibleStudyAppBar extends StatelessWidget {
  const BibleStudyAppBar({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.5.h),
      child: BottomSheetAppBar(
        title: "Bible study",
        function: () {
          audioPlayer.stop();
        },
      ),
    );
  }
}
