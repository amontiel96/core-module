import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

Future<void> initializeTemplateNotification() async {
  AwesomeNotifications().initialize(
      defaultTargetPlatform == TargetPlatform.android
          ? 'resource://drawable/logo'
          : null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Colors.white,
            ledColor: Colors.white,
            importance: NotificationImportance.High,
            vibrationPattern: lowVibrationPattern,
            playSound: true),
        NotificationChannel(
            channelKey: 'big_picture',
            channelName: 'Big pictures',
            channelDescription: 'Notifications with big and beautiful images',
            defaultColor: Colors.white,
            ledColor: Colors.white,
            vibrationPattern: lowVibrationPattern,
            importance: NotificationImportance.High,
            playSound: true),
        NotificationChannel(
            channelKey: 'big_text',
            channelName: 'Big text notifications',
            channelDescription: 'Notifications with a expandable body text',
            defaultColor: Colors.blueGrey,
            ledColor: Colors.blueGrey,
            vibrationPattern: lowVibrationPattern,
            playSound: true)
      ]);
}
