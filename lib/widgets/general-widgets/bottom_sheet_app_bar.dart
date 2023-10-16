import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({
    super.key,
    required this.title,
    required this.function,
  });

  final String title;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                function!();
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
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
