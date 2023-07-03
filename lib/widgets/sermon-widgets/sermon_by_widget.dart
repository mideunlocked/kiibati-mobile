import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonByWidget extends StatelessWidget {
  const SermonByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        "By: Bishop Bolanle Odeleke",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          // color: Colors.black38,
        ),
      ),
    );
  }
}
