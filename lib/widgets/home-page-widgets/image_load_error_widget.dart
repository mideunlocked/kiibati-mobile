import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageLoadErrorWidget extends StatelessWidget {
  const ImageLoadErrorWidget({
    super.key,
    required this.widget,
    this.width = double.infinity,
    required this.color,
  });

  final Widget widget;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: width,
      margin: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.center,
      child: widget,
    );
  }
}
