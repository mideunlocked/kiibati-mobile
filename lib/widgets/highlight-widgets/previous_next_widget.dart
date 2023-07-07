import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PreviousNextWidget extends StatelessWidget {
  const PreviousNextWidget({
    super.key,
    required this.pageController,
    required this.function,
  });

  final PageController pageController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        function();
      },
      child: SizedBox(
        height: 100.h,
        width: 40.w,
      ),
    );
  }
}
