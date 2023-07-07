import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonTitleWidget extends StatelessWidget {
  const SermonTitleWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        "Title: Running The Race Of Faith",
        style: textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
