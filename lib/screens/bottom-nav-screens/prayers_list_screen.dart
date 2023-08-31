import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/prayer.dart';
import '../../models/prayer_category.dart';
import '../../providers/prayer_provider.dart';
import '../../widgets/general-widgets/custom_progress_indicator.dart';
import '../../widgets/prayer_list_widget/prayer_grid_tile.dart';
import '../../widgets/sermon-list-widget/sermon_list_screen_app_bar.dart';

class PrayerListScreen extends StatefulWidget {
  const PrayerListScreen({super.key});

  @override
  State<PrayerListScreen> createState() => _PrayerListScreenState();
}

class _PrayerListScreenState extends State<PrayerListScreen> {
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );
    var sermonProvider = Provider.of<PrayerProvider>(context, listen: false);

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
            child: StreamBuilder<QuerySnapshot>(
                stream: sermonProvider.getPrayers(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CustomProgressIndicator());
                  } else if (snapshot.hasData == false &&
                      snapshot.data == null) {
                    return const Icon(Icons.error_rounded, color: Colors.white);
                  }
                  return GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3.w,
                      mainAxisSpacing: 1.5.h,
                      mainAxisExtent: 7.h,
                    ),
                    children:
                        snapshot.data?.docs.map((DocumentSnapshot prayer) {
                              List<dynamic> prayers = prayer["prayers"] ?? [];

                              return PrayerGridTile(
                                index: prayer["index"] ?? 0,
                                prayersCategory: PrayersCategory(
                                  id: prayer["id"] ?? "",
                                  name: prayer["title"] ?? "",
                                  prayers: prayers
                                      .map(
                                        (prayer) => Prayer(
                                          id: "",
                                          content: prayer["content"] ?? "",
                                          categoryId: "",
                                          prayerPoint: prayer["prayer"] ?? "",
                                          scripturalReference:
                                              prayer["verse"] ?? "",
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            }).toList() ??
                            [],
                  );
                }),
          )
        ],
      ),
    );
  }
}
