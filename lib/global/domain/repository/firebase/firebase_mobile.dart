

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/global/data/model/token_push_notification_model.dart';
import 'package:core_module/global/domain/interface/firebase_services_interface.dart';
import 'package:core_module/global/domain/repository/push_notification_repository.dart';
import 'package:core_module/utils/firebase/awesome_notification_template.dart';
import 'package:core_module/utils/permissions_utils_service.dart';
import 'package:flutter/foundation.dart';



class FirebaseServiceImpl implements FirebaseServicesInterface  {
  //final _deviceInformation = DeviceInformation();
  final _firebaseMessage = FirebaseMessaging.instance;
  final _repository = PushNotificationRepository.instance;


  @override
  String get className => runtimeType.toString();

  @override
  Future<void> createPushNotification(MessageNotification body) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToken() async {
    await _firebaseMessage.deleteToken();
    await _repository.removeTokenFCMSecureStorage();
  }

  @override
  Future<String?> getToken() async {
    final permission = await requestPermission();
    if (!permission) {
      return null;
    }
    final vapidKey = "";//EnvironmentInformationModel.instance.vapidKeyFirebaseWeb;
    String? deviceToken = await _firebaseMessage.getToken(
        vapidKey: vapidKey.isNotEmpty ? vapidKey : null);
    return (deviceToken == null) ? null : deviceToken;
  }

  @override
  Future<void> initMessaging() async {
    try {
      print('$className Messaging Notification Agent Handler init');
      String? tokenFCM = await getToken();
      if(defaultTargetPlatform == TargetPlatform.android) {
        await FirebaseMessaging.instance.setDeliveryMetricsExportToBigQuery(true);
      }
      debugPrint('$className: Token FCM ------> $tokenFCM');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('fcm_token', tokenFCM.toString());

      if (!kIsWeb) {
        await initializeTemplateNotification();

        //listen Notification
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          //PushNotificationsSegmentEvents().received(message);
          if (message.notification != null) {
            debugPrint('$className: from firebase -> ${message.toMap()}');

            RemoteNotification? notification = message.notification;

            if (notification != null) {
              if (defaultTargetPlatform == TargetPlatform.android) {
                AndroidNotification? android = message.notification?.android;
                if (android != null) {
                  AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 4,
                          channelKey: 'basic_channel',
                          title: notification.title,
                          body: notification.body,
                          largeIcon: android.imageUrl,
                          category: NotificationCategory.Message));
                }
              }
            }
          } else {
            debugPrint('$className: from provider -> ${message.toMap()}');
           // createNotificationAirship(message);
          }
        });

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          debugPrint(
              '$className: from provider (onMessageOpenedApp) -> ${message.toMap()}');
         // PushNotificationsSegmentEvents().tapped(message);
        });
      }
    } catch (e) {
      debugPrint('$className: trono 1 -> ${e.toString()}');
    }
  }

  @override
  Future<bool> requestPermission() async {
    Map<String, dynamic> settings = PermissionService.permissions;

    if (settings.containsKey('authorizationStatus') &&
        settings['authorizationStatus'] != 'authorized') {
      debugPrint('User declined or has not accepted permission...');
      return false;
    }
    debugPrint('$className: Success permission...');
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    return true;
  }

  @override
  Future<void> saveToken() async {
    /*final DeviceInformationModel information =
    await _deviceInformation.getInformation();*/
    String? deviceFCMToken = await _repository.getTokenFCMSecureStorage();
    final hasTokenFCM = !identical(deviceFCMToken, null);
    if (hasTokenFCM) {
      debugPrint('FCM TOKEN => $deviceFCMToken');
      return;
    }
    deviceFCMToken = await getToken();
    if (deviceFCMToken == null) {
      return;
    }
    debugPrint('FCM TOKEN => $deviceFCMToken');
    final model = TokenPushNotificationModel.withCountry(
      clientId: '',//information.userId ?? '',
      token: deviceFCMToken,
      os: kIsWeb ? 'web' : defaultTargetPlatform.name,
      phone: '',//information.phoneNumber ?? '',
      countryCode: ''//information.country ?? '',
    );
    try {
      final success = await _repository.saveTokenFCM(model);
      if (success) {
        await _repository.saveTokenFCMSecureStorage(model);
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
  
}