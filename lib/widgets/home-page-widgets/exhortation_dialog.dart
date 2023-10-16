import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../general-widgets/bottom_sheet_app_bar.dart';

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
    var primaryColor = of.primaryColor;
    var titleLarge = textTheme.titleLarge;
    var radius = const Radius.circular(15);

    return SafeArea(
      child: Container(
        height: 96.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            const BottomSheetAppBar(
              title: "Weekly Exhortation",
              function: null,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    // exhortation title
                    Text(
                      "Title: $title",
                      style: titleLarge?.copyWith(
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
                      height: 4.h,
                    ),

                    // exhortation text
                    Text(
                      body,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
