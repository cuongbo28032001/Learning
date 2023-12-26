// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:developer' as dev;
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  void initialize() async {
    print("_messaging.getToken()");
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _firebaseMessaging
          .getInitialMessage()
          .then((RemoteMessage? message) async {
        if (message != null) {
          dev.log(message.notification!.title.toString());
        }
      });

      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        dev.log(message.notification!.title.toString());
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        dev.log(message.notification!.title.toString());
      });
    }
  }
}
