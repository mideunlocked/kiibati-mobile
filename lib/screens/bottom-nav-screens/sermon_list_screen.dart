import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/sermon.dart';
import '../../providers/sermon_provider.dart';
import '../../widgets/general-widgets/custom_progress_indicator.dart';
import '../../widgets/sermon-list-widget/sermon_list_screen_app_bar.dart';
import '../../widgets/sermon-list-widget/sermon_list_widget.dart';

class SermonListScreen extends StatefulWidget {
  const SermonListScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SermonListScreen> createState() => _SermonListScreenState();
}

class _SermonListScreenState extends State<SermonListScreen> {
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );

    var sermonProvider = Provider.of<SermonProvider>(context, listen: false);

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
            child: StreamBuilder<QuerySnapshot>(
                stream: sermonProvider.getSermons(),
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

                  return ListView(
                    controller: widget.scrollController,
                    physics: const BouncingScrollPhysics(),
                    children: snapshot.data?.docs
                            .map(
                              (DocumentSnapshot sermon) => SermonListWidget(
                                sermon: Sermon(
                                  id: sermon["id"] ?? "",
                                  by: sermon["by"] ?? "",
                                  title: sermon["title"] ?? "",
                                  imageUrl: sermon["imageUrl"] ?? "",
                                  category: sermon["category"] ?? "",
                                  videoLink: sermon["videoLink"] ?? "",
                                  audioLink: sermon["audioLink"] ?? "",
                                  sermonText: sermon["sermonText"] ?? [],
                                  serviceType: sermon["serviceType"] ?? "",
                                  isDownloaded: sermon["isDownloaded"] ?? false,
                                  scripturalReference:
                                      sermon["reference"] ?? "",
                                  timestamp:
                                      sermon["timestamp"] ?? Timestamp.now(),
                                ),
                              ),
                            )
                            .toList() ??
                        [],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
