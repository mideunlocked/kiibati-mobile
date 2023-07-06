import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExhortationDialog extends StatelessWidget {
  const ExhortationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;

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
            vertical: 3.h,
            horizontal: 5.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // exhortation title
              Text(
                "Title: Give thanks",
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),

              // exhortation bible reference
              Text(
                "\"Give thanks to the Lord, for he is good; his love endures forever.\" - Psalm 107:1 (NIV)",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              // exhortation text
              const Text(
                "Embrace the power of gratitude this week. Take a moment each day to appreciate the blessings around you, both big and small. Cultivating a heart of gratitude brings joy, contentment, and a deeper connection to the goodness of life. Let gratitude be your guiding light, illuminating the path of positivity and abundance.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
