import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreIcon extends StatelessWidget {
  const MoreIcon({
    super.key,
    required this.iconUrl,
  });

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/$iconUrl.png",
      height: 7.h,
      width: 7.w,
    );
  }
}
