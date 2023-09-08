import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/memeber_provider.dart';
import '../../widgets/more-widgets/auth_check_widget.dart';
import '../../widgets/more-widgets/more_icon.dart';
import '../../widgets/more-widgets/more_list_tile.dart';
import '../../widgets/more-widgets/more_screen_app_bar.dart';
import '../more-screens/about_church_screen.dart';
import '../more-screens/find_church_screen.dart';
import '../more-screens/pastors_screen.dart';
import '../more-screens/pay_offering_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );
    var memberProvider = Provider.of<MemberProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          sizedBox,
          const MoreScreenAppBar(),
          Expanded(
            child: Column(
              children: [
                AuthCheckWidget(
                  memberProvider: memberProvider,
                ),

                // const MoreListTile(
                //   title: "Chat with us",
                //   widget: MoreIcon(
                //     iconUrl: "bubble-chat",
                //   ),
                //   page: ChatWithUsScreen(),
                // ),
                // const MoreListTile(
                //   title: "Bookmarks",
                //   widget: MoreIcon(
                //     iconUrl: "bookmark_2",
                //   ),
                //   page: BookmarksScreen(),
                // ),
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
                const Spacer(),
                Text(
                  "From",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 8.sp,
                  ),
                ),
                Text(
                  "© 2023 Stact Platforms Inc.",
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
