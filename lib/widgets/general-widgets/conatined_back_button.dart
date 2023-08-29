import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custome_back_button.dart';

class ContainedBackButton extends StatelessWidget {
  const ContainedBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 4.w),
      child: Container(
        height: 10.h,
        width: 10.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
        child: const CustomBackButton(
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
