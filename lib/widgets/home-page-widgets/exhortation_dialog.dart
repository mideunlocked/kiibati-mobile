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
    var primaryColor = of.primaryColor;
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
            const ExhortationAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
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

class ExhortationAppBar extends StatelessWidget {
  const ExhortationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/icons/close.png",
                height: 3.h,
                width: 3.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Text(
          "Weekly Exhortation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
