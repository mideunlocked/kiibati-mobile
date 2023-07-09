import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custome_back_button.dart';
import 'package:sizer/sizer.dart';

class SermonAppBar extends StatelessWidget {
  const SermonAppBar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
        bottom: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(),
          Text(
            "Sermon",
            style: textTheme.titleLarge,
          ),
          const Icon(
            Icons.arrow_circle_down_rounded,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
