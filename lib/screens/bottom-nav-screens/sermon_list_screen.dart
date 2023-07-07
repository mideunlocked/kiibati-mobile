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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          const SermonListScreenAppBar(),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView(
              children: const [
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
                SermonListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
