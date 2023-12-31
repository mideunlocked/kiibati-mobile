import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/home-page-widgets/announcements_widget.dart';
import '../../widgets/home-page-widgets/church_today_grid_view.dart';
import '../../widgets/home-page-widgets/exhortation_container.dart';
import '../../widgets/home-page-widgets/home_page_app_bar.dart';
import '../../widgets/home-page-widgets/home_page_title_subtitle.dart';
import '../../widgets/home-page-widgets/upcoming_service_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),

          // custom app bar
          const HomePageAppBar(),
          sizedBox,
          HomePageTitleSubtitle(
            title: "Upcoming service",
            subtitle:
                "Discover the heart of our next service as we explore an uplifting message together.",
            sizedBox: sizedBox,
          ),
          const UpcomingServiceWidget(),
          sizedBox,
          sizedBox,
          HomePageTitleSubtitle(
            title: "Announcement",
            subtitle:
                "Discover the latest updates, sermons, and activities happening in our church community.",
            sizedBox: sizedBox,
          ),
          const AnnouncemenstsWidget(),
          sizedBox,
          sizedBox,
          HomePageTitleSubtitle(
            title: "Church today",
            subtitle:
                "Experience the joy of community and spiritual nourishment at Church today!",
            sizedBox: sizedBox,
          ),
          const ChurchTodayGridView(),
          sizedBox,
          sizedBox,
          HomePageTitleSubtitle(
            title: "This weeks exhortation",
            subtitle:
                "Find inspiration and encouragement for the week ahead through our weekly exhortation.",
            sizedBox: sizedBox,
          ),
          const ExhortationContainer(),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
