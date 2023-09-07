import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to intialize notifications
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    await _firebaseMessaging.subscribeToTopic("Church");

    print("Token $fcmToken");
  }

  // function to handle recieved messages

  // function to initialize foreground and background settings
}
