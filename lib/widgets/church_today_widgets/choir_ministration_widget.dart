import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../providers/church_today_provider.dart';
import '../../screens/choir_ministration_screen.dart';
import '../general-widgets/custom_progress_indicator.dart';

class ChoirMinistrationWidget extends StatelessWidget {
  const ChoirMinistrationWidget({
    super.key,
    required this.churchTodayProvider,
  });

  final ChurchTodayProvier churchTodayProvider;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: churchTodayProvider.getChoirMinistration(),
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

          return ChoirMinistrationScreen(
            videoUrl: data["videoUrl"] ?? "",
          );
        });
  }
}
