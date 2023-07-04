import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AudioTime extends StatelessWidget {
  const AudioTime({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: TextStyle(
        color: Colors.white60,
        fontSize: 8.sp,
      ),
    );
  }
}
