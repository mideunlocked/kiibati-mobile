import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BibleVersionWidget extends StatelessWidget {
  const BibleVersionWidget({
    super.key,
    required this.version,
  });

  final String version;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      child: Text(
        version,
        style: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
