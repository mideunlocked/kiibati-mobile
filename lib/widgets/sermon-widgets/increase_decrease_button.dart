import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IncreaseDecreaseButton extends StatelessWidget {
  const IncreaseDecreaseButton({
    super.key,
    required this.icon,
    required this.function,
    required this.heroTag,
  });

  final String heroTag;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.sp,
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: () {
          function();
        },
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
