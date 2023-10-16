import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'bottom_nav_icon.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.pageController,
    required this.currentIndex,
  });

  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.white30,
            spreadRadius: 3,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavIcon(
            iconUrl: "home",
            pageController: pageController,
            index: 0,
            currentIndex: currentIndex,
          ),
          BottomNavIcon(
            iconUrl: "pulpit",
            pageController: pageController,
            index: 1,
            currentIndex: currentIndex,
          ),
          // BottomNavIcon(
          //   iconUrl: "pray",
          //   pageController: pageController,
          //   index: 2,
          //   currentIndex: currentIndex,
          // ),
          BottomNavIcon(
            iconUrl: "menu",
            pageController: pageController,
            index: 2,
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}
