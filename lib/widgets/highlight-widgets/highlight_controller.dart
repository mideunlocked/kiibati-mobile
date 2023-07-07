import 'package:flutter/material.dart';

import 'previous_next_widget.dart';

class HighlightController extends StatelessWidget {
  const HighlightController({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreviousNextWidget(
          pageController: pageController,
          function: () {
            pageController.previousPage(
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
        PreviousNextWidget(
          pageController: pageController,
          function: () {
            pageController.nextPage(
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
      ],
    );
  }
}
