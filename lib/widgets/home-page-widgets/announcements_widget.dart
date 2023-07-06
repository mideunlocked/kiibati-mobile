import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'announcement_container.dart';

class AnnouncemenstsWidget extends StatelessWidget {
  const AnnouncemenstsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return SizedBox(
      height: 20.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            AnnoucementContainer(primaryColor: primaryColor),
            AnnoucementContainer(primaryColor: primaryColor),
            AnnoucementContainer(primaryColor: primaryColor),
            AnnoucementContainer(primaryColor: primaryColor),
          ],
        ),
      ),
    );
  }
}
