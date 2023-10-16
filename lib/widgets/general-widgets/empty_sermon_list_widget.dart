import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class EmptySermonList extends StatelessWidget {
  const EmptySermonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Column(
        children: [
          LottieBuilder.asset("assets/lottie/bible.json"),
          const Text(
            "No sermons in this category",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "Please explore additional sermon categories to enhance your spiritual enrichment.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
