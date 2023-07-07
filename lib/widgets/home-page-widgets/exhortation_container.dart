import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'exhortation_dialog.dart';

class ExhortationContainer extends StatelessWidget {
  const ExhortationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return InkWell(
      onTap: () => showExhortationDialog(context), // show exhortation dialog
      child: Container(
        height: 30.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        margin: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // exhortation title
            Text(
              "Title: Give thanks",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            SizedBox(
              height: 0.5.h,
            ),

            // exhortation bible reference
            Text(
              "Verse:  Psalm 107:1",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),

            // exhortation text
            const Text(
              "Embrace the power of gratitude this week. Take a moment each day to appreciate the blessings around you, both big and small. Cultivating a heart of gratitude brings joy, contentment, and a deeper connection to the goodness of life. Let gratitude be your guiding light, illuminating the path of positivity and abundance.",
              maxLines: 6,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // function to exhortation dialog
  void showExhortationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return const ExhortationDialog();
      },
    );
  }
}
