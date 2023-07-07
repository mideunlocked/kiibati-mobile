import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HighlightIndicator extends StatelessWidget {
  const HighlightIndicator({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 0.2.h,
        margin: EdgeInsets.only(
          left: 1.w,
          right: 1.w,
          top: 2.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
