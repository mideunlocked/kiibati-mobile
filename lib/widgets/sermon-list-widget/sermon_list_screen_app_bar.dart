import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonPrayerListScreenAppBar extends StatelessWidget {
  const SermonPrayerListScreenAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.function,
  });

  final String title, subtitle;
  final Function function;

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
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: textTheme.bodySmall,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              function();
            },
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/icons/search.png",
              height: 2.5.h,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
