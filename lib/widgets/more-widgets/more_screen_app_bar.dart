import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreScreenAppBar extends StatelessWidget {
  const MoreScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "More",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
            fontSize: 16.sp,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign out",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
