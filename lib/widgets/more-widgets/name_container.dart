import 'package:flutter/material.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({
    super.key,
    required this.fullName,
  });

  final String fullName;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var scaffoldBackgroundColor = of.scaffoldBackgroundColor;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: scaffoldBackgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Text(
        fullName.characters.first,
      ),
    );
  }
}
