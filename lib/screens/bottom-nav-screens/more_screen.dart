import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/more-widgets/more_icon.dart';
import '../../widgets/more-widgets/more_list_tile.dart';
import '../../widgets/more-widgets/more_screen_app_bar.dart';
import '../../widgets/more-widgets/name_container.dart';
import '../more-screens/about_church_screen.dart';
import '../more-screens/bookmarks_screen.dart';
import '../more-screens/chat_with_us_screen.dart';
import '../more-screens/find_church_screen.dart';
import '../more-screens/pastors_screen.dart';
import '../more-screens/pay_offering_screen.dart';
import '../more-screens/profile_screen.dart';

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
                  page: const ProfileScreen(),
                ),
                const MoreListTile(
                  title: "Chat with us",
                  widget: MoreIcon(
                    iconUrl: "bubble-chat",
                  ),
                  page: ChatWithUsScreen(),
                ),
                const MoreListTile(
                  title: "Bookmarks",
                  widget: MoreIcon(
                    iconUrl: "bookmark_2",
                  ),
                  page: BookmarksScreen(),
                ),
                const MoreListTile(
                  title: "Pastors",
                  widget: MoreIcon(
                    iconUrl: "pastor",
                  ),
                  page: PastorsScreen(),
                ),
                const MoreListTile(
                  title: "Pay offering",
                  widget: MoreIcon(
                    iconUrl: "hand",
                  ),
                  page: PayOfferingScreen(),
                ),
                const MoreListTile(
                  title: "Find church",
                  widget: MoreIcon(
                    iconUrl: "location",
                  ),
                  page: FindChurchScreen(),
                ),
                const MoreListTile(
                  title: "About church",
                  widget: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                  ),
                  page: AboutScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}