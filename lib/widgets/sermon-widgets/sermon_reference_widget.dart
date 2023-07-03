import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonReferenceWidget extends StatelessWidget {
  const SermonReferenceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        "Reference: Isa. 54:17, Prov. 16:7",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          // color: Colors.black38,
        ),
      ),
    );
  }
}
