import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/prayer.dart';

class PrayerListTile extends StatelessWidget {
  const PrayerListTile({
    super.key,
    required this.prayer,
    required this.textSize,
  });

  final double textSize;
  final Prayer prayer;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 3.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title widget
          Row(
            children: [
              // indicator widget
              Icon(
                Icons.circle_rounded,
                size: 5.sp,
              ),
              SizedBox(
                width: 3.w,
              ),

              // prayer title
              SizedBox(
                width: 85.w,
                child: Text(
                  prayer.prayerPoint,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: textSize,
                  ),
                ),
              ),
            ],
          ),

          // prayer details
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // bible reference
                Text(
                  prayer.scripturalReference,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: textSize,
                  ),
                ),

                // prayer point
                Text(
                  prayer.content,
                  style: TextStyle(
                    fontSize: textSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
