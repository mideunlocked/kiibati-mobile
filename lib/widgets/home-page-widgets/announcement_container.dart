import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnnoucementContainer extends StatelessWidget {
  const AnnoucementContainer({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 80.w,
      margin: EdgeInsets.only(
        right: 3.w,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
