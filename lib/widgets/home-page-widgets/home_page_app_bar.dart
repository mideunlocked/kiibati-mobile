import 'package:firebase_auth/firebase_auth.dart';
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
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    final name = FirebaseAuth.instance.currentUser?.displayName ?? "";

    return Padding(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
      ),
      child: Row(
        children: [
          // period of day dialog
          Icon(
            periodOfDay == "Evening" || periodOfDay == "Night"
                ? Icons.nightlight_rounded
                : Icons.wb_sunny_outlined,
            color: primaryColor,
          ),
          SizedBox(
            width: 1.w,
          ),

          // greeting (greet user according to time of the day)
          Text(
            "Good $periodOfDay $name",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 8.sp,
            ),
          ),

          // spacer
          const Spacer(),

          // notification icon
          Icon(
            Icons.notifications_rounded,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
