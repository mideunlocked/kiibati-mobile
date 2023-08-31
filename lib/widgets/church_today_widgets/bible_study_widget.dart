import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/sermon.dart';
import '../../providers/church_today_provider.dart';
import '../../screens/sermon_screen.dart';
import '../general-widgets/custom_progress_indicator.dart';

class BibleStudyWidget extends StatelessWidget {
  const BibleStudyWidget({
    super.key,
    required this.churchTodayProvider,
  });

  final ChurchTodayProvier churchTodayProvider;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: churchTodayProvider.getBibleStudy(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomProgressIndicator());
          } else if (snapshot.hasData == false && snapshot.data == null) {
            return const Icon(Icons.error_rounded, color: Colors.white);
          }

          Map<String, dynamic> data =
              snapshot.data?.docs.first.data()! as Map<String, dynamic>;

          return SermonScreen(
            sermon: Sermon(
              id: data["id"] ?? "",
              by: data["by"] ?? "",
              title: data["title"] ?? "",
              imageUrl: data["imageUrl"] ?? "",
              category: data["category"] ?? "",
              videoLink: data["videoLink"] ?? "",
              audioLink: data["audioLink"] ?? "",
              sermonText: data["sermonText"] ?? [],
              serviceType: data["sermonType"] ?? "",
              isDownloaded: data["isDownloaded"] ?? false,
              scripturalReference: data["reference"] ?? "",
              timestamp: data["timestamp"] ?? Timestamp.now(),
            ),
          );
        });
  }
}
