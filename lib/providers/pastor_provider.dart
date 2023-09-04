import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PastorProvider with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getPastors() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
          cloudInstance.collection("pastors").orderBy("timestamp").snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get pastors error: $e");
      return const Stream.empty();
    }
  }

  Stream<QuerySnapshot> getBishop() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("pastors")
          .where("id", isEqualTo: "bishop")
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get pastors error: $e");
      return const Stream.empty();
    }
  }
}
