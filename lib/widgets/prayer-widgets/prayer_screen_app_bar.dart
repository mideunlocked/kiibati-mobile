import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import '../general-widgets/custome_back_button.dart';

class PrayerSreenAppBar extends StatelessWidget {
  const PrayerSreenAppBar({
    super.key,
    required this.title,
    required this.scrollController,
  });

  final String title;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: scrollController.hasClients &&
                    scrollController.position.userScrollDirection ==
                        ScrollDirection.reverse
                ? 0
                : 10.h,
            child: child,
          );
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 2.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomBackButton(),
              Text(
                title,
                style: TextStyle(color: primaryColor),
              ),
              const Icon(
                Icons.arrow_circle_down_rounded,
                color: Colors.black54,
              ),
            ],
          ),
        ));
  }
}
