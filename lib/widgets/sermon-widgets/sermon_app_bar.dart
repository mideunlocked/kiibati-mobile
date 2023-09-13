import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custome_back_button.dart';
import 'package:sizer/sizer.dart';

class SermonAppBar extends StatelessWidget {
  const SermonAppBar({
    super.key,
    required this.textTheme,
    required this.scrollController,
  });

  final TextTheme textTheme;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
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
              "Sermon",
              style: textTheme.titleLarge,
            ),
            const Icon(
              Icons.arrow_circle_down_rounded,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
