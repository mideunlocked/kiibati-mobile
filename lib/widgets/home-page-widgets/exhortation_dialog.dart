import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExhortationDialog extends StatelessWidget {
  const ExhortationDialog({
    super.key,
    required this.title,
    required this.verse,
    required this.body,
    required this.reference,
  });

  final String title;
  final String verse;
  final String body;
  final String reference;

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
        height: 60.h,
        width: 90.w,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // exhortation title
                Text(
                  "Title: $title",
                  style: textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),

                // exhortation bible reference
                Text(
                  "$verse - $reference",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),

                // exhortation text
                Text(
                  body,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
