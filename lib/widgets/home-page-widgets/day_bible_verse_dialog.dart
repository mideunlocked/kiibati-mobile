import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DayBibleVerseDialog extends StatelessWidget {
  const DayBibleVerseDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);

    var sizedBox = SizedBox(
      height: 2.h,
    );
    return Dialog(
      backgroundColor: of.primaryColor,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 50.h,
        width: 90.w,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4.h,
            horizontal: 5.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verse of the day",
                style: of.textTheme.bodySmall?.copyWith(
                  color: Colors.white60,
                ),
              ),
              sizedBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "The Lord is my strength and my shield; my heart trusts in him, and he helps me. My heart leaps for joy, and with my song I praise him.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              sizedBox,
              Text(
                "- Psalm 28:7 (NIV)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
