import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/sermon-list-widget/sermon_list_screen_app_bar.dart';
import '../../widgets/sermon-list-widget/sermon_list_widget.dart';

class SermonListScreen extends StatefulWidget {
  const SermonListScreen({super.key});

  @override
  State<SermonListScreen> createState() => _SermonListScreenState();
}

class _SermonListScreenState extends State<SermonListScreen> {
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          sizedBox,

          // sermons app bar
          SermonPrayerListScreenAppBar(
            title: "Sermons",
            subtitle:
                "Deepen your spiritual journey and gain fresh insights into God's Word through our enriching sermons.",
            function: () {},
          ),
          sizedBox,

          // sermons list view
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
                const SermonListWidget(),
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
