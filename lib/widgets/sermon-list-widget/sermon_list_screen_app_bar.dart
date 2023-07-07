import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonListScreenAppBar extends StatelessWidget {
  const SermonListScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var primaryColor = of.primaryColor;

    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sermons",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "Deepen your spiritual journey and gain fresh insights into God's Word through our enriching sermons.",
                  style: textTheme.bodySmall,
                )
              ],
            ),
          ),
          Image.asset(
            "assets/icons/search.png",
            height: 2.5.h,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
