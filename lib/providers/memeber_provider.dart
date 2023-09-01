import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MemberProvider with ChangeNotifier {
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;
  FirebaseAuth authInstance = FirebaseAuth.instance;

  Stream<QuerySnapshot> getUserDetails() {
    String uid = authInstance.currentUser!.uid;

    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = cloudInstance
          .collection("users")
          .where("id", isEqualTo: uid)
          .snapshots();

      return querySnapshot;
    } catch (e) {
      print("Get sermons error: $e");
      return const Stream.empty();
    }
  }
}
