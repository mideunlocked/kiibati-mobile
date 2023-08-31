import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/sermon-widgets/sermon_by_widget.dart';
import 'package:sizer/sizer.dart';

import '../../models/sermon.dart';

class SermonDetailWidget extends StatelessWidget {
  const SermonDetailWidget({
    super.key,
    required this.textTheme,
    required this.sizedBox,
    required this.dateTime,
    required this.sermon,
  });

  final Sermon sermon;
  final TextTheme textTheme;
  final SizedBox sizedBox;
  final List<String> dateTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // sermon title
          Text(
            sermon.title,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          sizedBox,

          // sermon taking by
          SermonByWidget(
            by: sermon.by,
            isList: true,
          ),
          sizedBox,

          // sermon date
          Text(
            dateTime[1],
            style: textTheme.bodySmall?.copyWith(
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
