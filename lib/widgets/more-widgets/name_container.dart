import 'package:flutter/material.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({
    super.key,
    required this.fullName,
  });

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
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
