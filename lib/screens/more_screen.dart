import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/more-widgets/more_icon.dart';
import '../widgets/more-widgets/more_list_tile.dart';
import '../widgets/more-widgets/more_screen_app_bar.dart';
import '../widgets/more-widgets/name_container.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );
    var fullName = "Ariyo Osuolale";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          sizedBox,
          const MoreScreenAppBar(),
          Expanded(
            child: Column(
              children: [
                MoreListTile(
                  title: fullName,
                  widget: NameContainer(fullName: fullName),
                ),
                const MoreListTile(
                  title: "Chat with us",
                  widget: MoreIcon(
                    iconUrl: "bubble-chat",
                  ),
                ),
                const MoreListTile(
                  title: "Bookmarks",
                  widget: MoreIcon(
                    iconUrl: "bookmark_2",
                  ),
                ),
                const MoreListTile(
                  title: "Pastors",
                  widget: MoreIcon(
                    iconUrl: "pastor",
                  ),
                ),
                const MoreListTile(
                  title: "Pay offering",
                  widget: MoreIcon(
                    iconUrl: "hand",
                  ),
                ),
                const MoreListTile(
                  title: "Find church",
                  widget: MoreIcon(
                    iconUrl: "location",
                  ),
                ),
                const MoreListTile(
                  title: "About church",
                  widget: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
