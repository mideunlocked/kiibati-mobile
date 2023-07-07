import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonDetailWidget extends StatelessWidget {
  const SermonDetailWidget({
    super.key,
    required this.textTheme,
    required this.sizedBox,
    required this.dateTime,
  });

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
            "Running The Race Of Faith",
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          sizedBox,

          // sermon taking by
          Text(
            "Bishop Bolanle Odeleke",
            style: textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
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
