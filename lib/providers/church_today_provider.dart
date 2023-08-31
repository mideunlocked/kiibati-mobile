import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChurchTodayProvier with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getVerseOfWeek() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("verse-of-the-week")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get verse of the week error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getPrayerForWeek() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("prayers-for-week")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get prayers-for-week error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getBibleStudy() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("bible-study")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get bible-study error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getChoirMinistration() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("choir-ministration")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get choir-ministration error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getWeekHighlights() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("last-sunday-highlights")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get last-sunday-highlights error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getLatestSermon() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("sermons")
          .orderBy("timestamp", descending: true)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get latest sermon error: $e");
      return const Stream.empty();
    }
  }
}
