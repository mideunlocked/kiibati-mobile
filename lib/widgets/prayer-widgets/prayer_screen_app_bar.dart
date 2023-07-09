import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../general-widgets/custome_back_button.dart';

class PrayerSreenAppBar extends StatelessWidget {
  const PrayerSreenAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
        bottom: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(),
          Text(
            title,
            style: TextStyle(color: primaryColor),
          ),
          const Icon(
            Icons.arrow_circle_down_rounded,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
