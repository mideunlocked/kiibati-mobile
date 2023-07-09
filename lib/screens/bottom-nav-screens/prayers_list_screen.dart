import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/prayer_list_widget/prayer_grid_tile.dart';
import '../../widgets/sermon-list-widget/sermon_list_screen_app_bar.dart';

class PrayerListScreen extends StatefulWidget {
  const PrayerListScreen({super.key});

  @override
  State<PrayerListScreen> createState() => _PrayerListScreenState();
}

class _PrayerListScreenState extends State<PrayerListScreen> {
  List<String> prayerTitle = [
    "MEN",
    "WOMEN",
    "YOUTH",
    "CHILDREN",
    "LOVE",
    "ANXIETY",
    "ANGER",
    "HOPE",
    "DEPRESSION",
    "PEACE",
    "FEAR",
    "STRESS",
    "PATIENCE",
    "TEMPTATION",
    "PRIDE",
    "DOUBT",
    "JOY",
    "JEALOUSY",
    "LOSS",
    "HEALING",
  ];

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

          // Prayer app bar
          SermonPrayerListScreenAppBar(
            title: "Prayers",
            subtitle:
                "Let prayer be your guide as you navigate life's challenges and embrace the blessings that unfold along your spiritual journey.",
            function: () {},
          ),
          sizedBox,

          // Prayer grid view widget
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 1.5.h,
                mainAxisExtent: 7.h,
              ),
              itemCount: prayerTitle.length +
                  4, // Number of grid items plus 4 extra to add bottom spacing so there wot be obstruction with the grid widget and the bottom nav bar
              itemBuilder: (context, index) {
                if (index >= prayerTitle.length) {
                  // this will add 4 extra grid tile for spacing
                  return SizedBox(
                    height: 10.h,
                  );
                }
                return PrayerGridTile(
                  prayerTitle: prayerTitle[index],
                  index: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
