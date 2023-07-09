import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data.dart';
import '../widgets/general-widgets/custome_back_button.dart';
import '../widgets/highlight-widgets/highlight_image.dart';
import '../widgets/highlight-widgets/highlight_indicator.dart';

class ChurchHighlightScreen extends StatefulWidget {
  const ChurchHighlightScreen({super.key});

  @override
  State<ChurchHighlightScreen> createState() => _ChurchHighlightScreenState();
}

class _ChurchHighlightScreenState extends State<ChurchHighlightScreen> {
  var initialPage = 0;
  var currentImage = 0;
  var currentIndex = 0;

  final pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            // highlight view
            PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: images
                  .map(
                    (image) => HighlightImage(
                      // highlight image
                      pageController: pageController,
                      image: image["url"] ?? "",
                    ),
                  )
                  .toList(),
            ),

            // highlight indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Row(
                children: images.map((e) {
                  return HighlightIndicator(
                    color: e["index"] <= currentIndex
                        ? Colors.white
                        : Colors.white38,
                  );
                }).toList(),
              ),
            ),

            // custom back button
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Row(
                children: [
                  const CustomBackButton(
                    iconColor: Colors.white,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Last Sunday service highlights",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
