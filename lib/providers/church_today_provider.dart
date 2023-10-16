import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/models/bible_study.dart';

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

  Future<BibleStudy> getBibleStudy() async {
    BibleStudy bibleStudy;

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await cloudInstance
          .collection("bible-study")
          .orderBy("timestamp", descending: true)
          .get();

      var data = querySnapshot.docs.first.data();

      bibleStudy = BibleStudy(
        by: data["by"] ?? "",
        chapter: data["chapter"] ?? "",
        version: data["version"] ?? "",
        bookName: data["bookName"] ?? "",
        audioLink: data["audioLink"] ?? "",
      );

      return bibleStudy;
    } catch (e) {
      print("Get bible-study error: $e");
      return Future.error("Get bible-study error: $e");
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
