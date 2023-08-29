import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnnoucementContainer extends StatelessWidget {
  const AnnoucementContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeDate,
  });

  final String title, subtitle, timeDate;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;

    return Container(
      height: 35.h,
      width: 80.w,
      margin: EdgeInsets.only(
        right: 3.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: of.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              timeDate,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
