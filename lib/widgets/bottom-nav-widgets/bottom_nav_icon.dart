import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    super.key,
    required this.iconUrl,
    required this.index,
    required this.pageController,
    required this.currentIndex,
  });

  final String iconUrl;
  final int index;
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changePage(index, context),
      child: Image.asset(
        "assets/icons/$iconUrl.png",
        color: currentIndex == index ? Colors.white : Colors.white60,
        height: 8.h,
        width: 8.h,
      ),
    );
  }

  // function to change page in bottom nav
  void changePage(int index, context) {
    pageController.animateToPage(
      index,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 200),
    );
  }
}
