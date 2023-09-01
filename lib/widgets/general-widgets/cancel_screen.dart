import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CancelScreen extends StatelessWidget {
  const CancelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(
            "assets/icons/close.png",
            height: 4.h,
            width: 4.w,
          ),
        ),
      ],
    );
  }
}
