import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.color = const Color.fromARGB(255, 46, 0, 102),
    this.backgroundColor = Colors.white60,
  });

  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 1.0,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}
