import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:core_module/utils/firebase/awesome_notification_template.dart';
import 'package:flutter/foundation.dart';
import 'package:core_module/core_module.dart';

Future<void> handlerNotification(RemoteMessage message) async {
  try {
    //PushNotificationsSegmentEvents().received(message);
    Map<String, dynamic> pinpointMessage = message.data;
    var jsonBody = pinpointMessage['pinpoint.jsonBody'] ?? 'Airship';

    if (jsonBody == 'Airship') {
      createNotificationAirship(message);
    } else {
      var js = json.decode(jsonBody);
      var value = js['data'];
      if (value == '') {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 4,
                channelKey: 'basic_channel',
                title: pinpointMessage['pinpoint.notification.title'],
                body: pinpointMessage['pinpoint.notification.body'],
                largeIcon: (defaultTargetPlatform == TargetPlatform.android)
                    ? pinpointMessage['pinpoint.notification.imageUrl']
                    : pinpointMessage['pinpoint.notification.mediaUrl'],
                category: NotificationCategory.Message));
      } else {
        var jsonNotifications = jsonDecode(value);
        jsonNotifications[NOTIFICATION_CONTENT][NOTIFICATION_ID] = 4;
        jsonNotifications[NOTIFICATION_CONTENT][NOTIFICATION_TITLE] =
            pinpointMessage['pinpoint.notification.title'];
        jsonNotifications[NOTIFICATION_CONTENT][NOTIFICATION_BODY] =
            pinpointMessage['pinpoint.notification.body'];
        jsonNotifications[NOTIFICATION_CONTENT][NOTIFICATION_LARGE_ICON] =
            (defaultTargetPlatform == TargetPlatform.android)
                ? pinpointMessage['pinpoint.notification.imageUrl']
                : pinpointMessage['pinpoint.notification.mediaUrl'];
        AwesomeNotifications()
            .createNotificationFromJsonData(jsonNotifications);
      }
    }
  } catch (e, s) {
    debugPrint('onBackground error: ${e.toString()}');
    debugPrintStack(stackTrace: s);
  }
}

void createNotificationAirship(RemoteMessage message) async {
  initializeTemplateNotification();
  Map<String, dynamic> data = message.data;
  debugPrint('Onbackground Airship: $data');

  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 4,
        channelKey: 'basic_channel',
        title: data['com.urbanairship.title'],
        body: data['com.urbanairship.push.ALERT'],
        category: NotificationCategory.Message),
  );
}
