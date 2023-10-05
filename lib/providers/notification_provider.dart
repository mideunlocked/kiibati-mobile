import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getNotifications() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("notifications")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get notification error: $e");
      return const Stream.empty();
    }
  }
}
