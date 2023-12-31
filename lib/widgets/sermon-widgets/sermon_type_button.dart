import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonTypeButton extends StatelessWidget {
  const SermonTypeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.function,
    this.iconColor = Colors.white,
    required this.heroTag,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String heroTag;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42.w,
      child: FloatingActionButton.extended(
        heroTag: heroTag,
        onPressed: () {
          function();
        },
        label: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
