import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'increase_decrease_button.dart';

class SermonScreenFloatingActionButtons extends StatelessWidget {
  const SermonScreenFloatingActionButtons({
    super.key,
    required this.increaseText,
    required this.decreaseText,
    this.padding = 1,
  });

  final Function increaseText, decreaseText;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
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
