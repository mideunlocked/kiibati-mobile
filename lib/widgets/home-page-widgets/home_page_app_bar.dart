import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/date_time_formatting.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final periodOfDay = DateTimeFormatting().getGreeting();

    return Row(
      children: [
        // period of day dialog
        Icon(
          periodOfDay == "Evening" || periodOfDay == "Night"
              ? Icons.nightlight_rounded
              : Icons.wb_sunny_outlined,
          color: Colors.black26,
        ),
        SizedBox(
          width: 1.w,
        ),

        // greeting (greet user according to time of the day)
        Text(
          "Good $periodOfDay Ariyo",
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w500,
            fontSize: 8.sp,
          ),
        ),

        // spacer
        const Spacer(),

        // notification icon
        const Icon(
          Icons.notifications_rounded,
          color: Colors.black26,
        ),
      ],
    );
  }
}
