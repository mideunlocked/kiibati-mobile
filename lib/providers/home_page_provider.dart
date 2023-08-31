import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUpcomingService() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
          cloudInstance.collection("upcoming-service").snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get upcoming service error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getAnnouncement() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("announcements")
          .orderBy("timestamp")
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get announcement error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getExhortation() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("weekly-exhortation")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get weekly exhortation error: $e");
      return const Stream.empty();
    }
  }
}
