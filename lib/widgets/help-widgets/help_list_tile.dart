import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HelpListTile extends StatelessWidget {
  const HelpListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.function,
  });

  final String title;
  final String subtitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: primaryColor,
        size: 15.sp,
      ),
      onTap: () => function(),
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
      subtitleTextStyle: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black54,
        fontSize: 10.sp,
      ),
    );
  }
}
