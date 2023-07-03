import 'package:flutter/material.dart';
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
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
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
