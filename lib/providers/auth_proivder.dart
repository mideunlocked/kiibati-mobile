import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/member.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  FirebaseFirestore cloudInstance = FirebaseFirestore.instance;

  Future<dynamic> createUserEmailAndPassword(
    Member member,
  ) async {
    try {
      await authInstance
          .createUserWithEmailAndPassword(
        email: member.emailAddress,
        password: member.password,
      )
          .then((value) {
        cloudInstance.collection("users").doc(value.user?.uid).set({
          "id": value.user?.uid,
          "firstName": member.firstName,
          "lastName": member.lastName,
          "email": member.emailAddress,
          "mobileNumber": member.mobileNumber,
          "profession": member.profession,
          "dateOfBirth": member.dateOfBirth,
          "maritalStatus": member.maritalStatus,
          "imageUrl": member.imageUrl,
        });
        authInstance.currentUser?.updateDisplayName(
          member.firstName,
        );
      });

      notifyListeners();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return "The account already exists for that email.";
      } else {
        print(e);
        return e.message;
      }
    } catch (e) {
      notifyListeners();

      print("Sign up error: $e");
      return e.toString();
    }
  }

  Future<dynamic> signInUSer(
    String loginDetail,
    String password,
  ) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: loginDetail,
        password: password,
      );

      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email/username.');
        return 'No user found for that email/username.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Wrong password provided for that user.';
      } else {
        print(e);
        return e.message;
      }
    } catch (e) {
      notifyListeners();

      print("Sign in error: $e");
      return e;
    }
  }

  Future<dynamic> resetPassword(
    String email,
  ) async {
    try {
      authInstance.sendPasswordResetEmail(email: email);

      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email.';
      } else {
        print(e);
        return e.message;
      }
    } catch (e) {
      notifyListeners();

      print("Resest password error: $e");
      return e.toString();
    }
  }

  Future<dynamic> changePassword(String newPassword) async {
    try {
      authInstance.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return "The password provided is too weak.";
      } else if (e.code == "requires-recent-login") {
        print("User needs to sign in again before password can be changed.");
      }
    } catch (e) {
      notifyListeners();

      print("Change password error: $e");
      return e.toString();
    }
  }

  Future<dynamic> updateUserDetails(Member member) async {
    final uid = authInstance.currentUser?.uid;

    try {
      await cloudInstance.collection("users").doc(uid).update({
        "id": uid,
        "firstName": member.firstName,
        "lastName": member.lastName,
        "email": member.emailAddress,
        "mobileNumber": member.mobileNumber,
        "profession": member.profession,
        "dateOfBirth": member.dateOfBirth,
        "maritalStatus": member.maritalStatus,
        "imageUrl": member.imageUrl,
      });
    } catch (e) {
      notifyListeners();
      print("Update user details error: $e");
      return e.toString();
    }
  }
}
