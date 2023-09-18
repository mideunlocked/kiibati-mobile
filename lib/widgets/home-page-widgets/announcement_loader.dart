import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'announcement_container.dart';

class AnnouncementLoadingWidget extends StatelessWidget {
  const AnnouncementLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          SizedBox(
            width: 4.w,
          ),
          const AnnoucementContainer(
            title: "xxxxxxxx",
            subtitle:
                "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            timeDate: "xxxxxxxx",
          ),
          const AnnoucementContainer(
            title: "xxxxxxxx",
            subtitle:
                "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            timeDate: "xxxxxxxx",
          ),
        ],
      ),
    );
  }
}
