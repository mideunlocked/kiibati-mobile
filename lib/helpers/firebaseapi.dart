import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to intialize notifications
  Future<void> initNotification() async {
    try {
      await _firebaseMessaging.requestPermission();

      final fcmToken = await _firebaseMessaging.getToken();
      await _firebaseMessaging.subscribeToTopic("Church");

      print(fcmToken);

      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    } catch (e) {
      print("Error initializing notifications: $e");
    }
  }

  // function to handle recieved messages
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  // function to initialize foreground and background settings
}
