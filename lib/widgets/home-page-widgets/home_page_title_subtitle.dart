import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageTitleSubtitle extends StatelessWidget {
  const HomePageTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sizedBox,
  });

  final String title, subtitle;
  final SizedBox sizedBox;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var primaryColor = of.primaryColor;

    return Padding(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            subtitle,
            style: textTheme.bodySmall,
          ),
          sizedBox,
        ],
      ),
    );
  }
}
