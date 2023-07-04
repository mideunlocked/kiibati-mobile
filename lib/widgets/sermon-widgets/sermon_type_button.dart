import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonTypeButton extends StatelessWidget {
  const SermonTypeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.function,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
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
            width: 3.w,
          ),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
