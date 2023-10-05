import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kiibati_mobile/main.dart';
import 'package:kiibati_mobile/screens/navigation_screen.dart';

// function to handle recieved messages
@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  navigatorKey.currentState?.pushNamed(
    NotificationScreen.routeName,
  );
}

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This is the channel used for important notifications',
    importance: Importance.defaultImportance,
    enableLights: true,
    enableVibration: true,
    showBadge: true,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  // function to initialize foreground and background settings
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed(
      NotificationScreen.routeName,
    );
  }

  Future initPushLocalNotifications() async {
    var iOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestProvisionalPermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );
    const android = AndroidInitializationSettings('@drawable/launcher_icon');
    var settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      final String? newPayload = payload.payload;

      final message = RemoteMessage.fromMap(
        jsonDecode(newPayload!),
      );
      handleMessage(message);
    });

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/launcher_icon',
            ),
          ),
          payload: jsonEncode(event.toMap()));
    });
  }

  // function to intialize notifications
  Future<void> initNotification() async {
    try {
      await _firebaseMessaging.requestPermission();

      final fcmToken = await _firebaseMessaging.getToken();
      await _firebaseMessaging.subscribeToTopic("Church");

      print(fcmToken);

      initPushNotifications();
      initPushLocalNotifications();
    } catch (e) {
      print("Error initializing notifications: $e");
    }
  }
}
