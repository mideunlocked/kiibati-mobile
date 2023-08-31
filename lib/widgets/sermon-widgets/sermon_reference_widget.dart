import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonReferenceWidget extends StatelessWidget {
  const SermonReferenceWidget({
    super.key,
    required this.reference,
  });

  final String reference;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        "Reference: $reference",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          // color: Colors.black38,
        ),
      ),
    );
  }
}
