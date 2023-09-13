import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import 'increase_decrease_button.dart';

class SermonScreenFloatingActionButtons extends StatelessWidget {
  const SermonScreenFloatingActionButtons({
    super.key,
    required this.increaseText,
    required this.decreaseText,
    this.padding = 1,
    required this.scrollController,
  });

  final Function increaseText, decreaseText;
  final double padding;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        return AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.only(
            left: scrollController.hasClients &&
                    scrollController.position.userScrollDirection ==
                        ScrollDirection.reverse
                ? 100.w
                : 0,
            bottom: padding,
          ),
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // increment floating action button
          IncreaseDecreaseButton(
            heroTag: "3",
            function: () {
              increaseText();
            },
            icon: Icons.keyboard_arrow_up_rounded,
          ),

          SizedBox(
            height: 1.h,
          ),

          // decrement floating action button
          IncreaseDecreaseButton(
            heroTag: "4",
            function: () {
              decreaseText();
            },
            icon: Icons.keyboard_arrow_down_rounded,
          ),
        ],
      ),
    );
  }
}
