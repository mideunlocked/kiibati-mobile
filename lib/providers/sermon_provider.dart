import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SermonProvider with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getSermons() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("sermons")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get sermons error: $e");
      return const Stream.empty();
    }
  }
}
