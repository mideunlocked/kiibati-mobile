import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonTitleWidget extends StatelessWidget {
  const SermonTitleWidget({
    super.key,
    required this.textTheme,
    required this.title,
  });

  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        "Title: $title",
        style: textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
