import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonTextWidget extends StatelessWidget {
  const SermonTextWidget({
    super.key,
    required this.textSize,
    required this.data,
  });

  final double textSize;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          Text(
            "      $data",
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
