import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class NotificationService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else {
      print('user denied permission');
    }
  }

   getDeviceToken() async {
    String? token = await messaging.getToken();
    print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("NotificationToken", token.toString());
    return token!;
  }
   AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
      playSound: true);


  void showNotification(id,title,body) {

    _flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }
}