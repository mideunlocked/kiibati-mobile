import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return CircularProgressIndicator(
      strokeWidth: 1.0,
      color: primaryColor,
      backgroundColor: Colors.white60,
    );
  }
}
