import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/bible_study.dart';

class BibleVerseWidget extends StatelessWidget {
  const BibleVerseWidget({
    super.key,
    required this.verse,
  });

  final Verse verse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${verse.number}.",
            style: const TextStyle(
              color: Colors.amber,
            ),
          ),
          SizedBox(
            width: 85.w,
            child: Text(
              verse.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
