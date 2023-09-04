import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/pastor.dart';
import '../models/sermon.dart';
import '../providers/sermon_provider.dart';
import '../widgets/general-widgets/conatined_back_button.dart';
import '../widgets/general-widgets/custom_progress_indicator.dart';
import '../widgets/general-widgets/shaded_image.dart';
import '../widgets/sermon-list-widget/sermon_list_widget.dart';
// import '../widgets/sermon-list-widget/sermon_list_widget.dart';

class PastorCatalogueScreen extends StatelessWidget {
  const PastorCatalogueScreen({super.key, required this.pastor});

  final Pastor pastor;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;
    var bodyMedium = textTheme.bodyMedium;

    final sermonProvider = Provider.of<SermonProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadedImage(imageUrl: pastor.imageUrl),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${pastor.title} ${pastor.fullName}",
                        style: titleLarge,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        pastor.position,
                        style: bodyMedium,
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: sermonProvider.getPastorSermon(pastor.id),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CustomProgressIndicator());
                            } else if (snapshot.hasData == false &&
                                snapshot.data == null) {
                              return const Text(
                                "Pastor has no sermon in catalogue",
                                style: TextStyle(color: Colors.black),
                              );
                            }

                            return ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: snapshot.data?.docs
                                      .map(
                                        (DocumentSnapshot sermon) =>
                                            SermonListWidget(
                                          sermon: Sermon(
                                            id: sermon["id"] ?? "",
                                            by: sermon["by"] ?? "",
                                            title: sermon["title"] ?? "",
                                            imageUrl: sermon["imageUrl"] ?? "",
                                            category: sermon["category"] ?? "",
                                            videoLink:
                                                sermon["videoLink"] ?? "",
                                            audioLink:
                                                sermon["audioLink"] ?? "",
                                            sermonText:
                                                sermon["sermonText"] ?? [],
                                            serviceType:
                                                sermon["serviceType"] ?? "",
                                            isDownloaded:
                                                sermon["isDownloaded"] ?? false,
                                            scripturalReference:
                                                sermon["reference"] ?? "",
                                            timestamp: sermon["timestamp"] ??
                                                Timestamp.now(),
                                          ),
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ContainedBackButton(),
        ],
      ),
    );
  }
}
