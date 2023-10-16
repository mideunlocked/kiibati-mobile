import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      "assets/lottie/kiibati_loader.json",
      height: 10.h,
      width: 10.w,
    );
  }
}
