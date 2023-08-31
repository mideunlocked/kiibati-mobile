import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageLoadErrorWidget extends StatelessWidget {
  const ImageLoadErrorWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Container(
      height: 20.h,
      width: 100.w,
      alignment: Alignment.center,
      color: primaryColor.withOpacity(0.7),
      child: widget,
    );
  }
}
