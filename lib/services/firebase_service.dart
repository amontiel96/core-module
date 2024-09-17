
import 'package:core_module/global/domain/repository/firebase/firebase_repository.dart';
import 'package:core_module/utils/firebase/push_notification_on_backgroud_handler.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:core_module/core_module.dart';

import '../global/domain/repository/firebase/firebase_export.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handlerNotification(message);
}


class FirebaseService with FirebaseRepository {
  FirebaseService._();

  static final FirebaseService instance = FirebaseService._();

  // Toggle this to cause an async error to be thrown during initialization
  // and to test that runZonedGuarded() catches the error
  static const _kShouldTestAsyncErrorOnInit = false;

  // Toggle this for testing Crashlytics in your app locally.
  static const _kTestingCrashlytics = false;


  //final _firebaseMessage = FirebaseMessaging.instance;
  //final _repository = PushNotificationRepository.instance;

  static Future<void> init({String? name, FirebaseOptions? options}) async {
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      String serviceName =
          'trainUp-app';
      //await Firebase.initializeApp(name: serviceName, options: options);
      if (kIsWeb) {
        await Firebase.initializeApp(options: options);
      } else {
        await Firebase.initializeApp(name: serviceName, options: options);
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  static Future<void> initFirebaseServices() async {
    try {
      _initCrashlyticsService();
      _initPerformanceService();
      _initializeFirebaseServices();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }


  static Future<void> _initCrashlyticsService() async {
    if(!kIsWeb){
      try {
        // Pass all uncaught errors from the framework to Crashlytics.
        FlutterError.onError = (errorDetails) {
          // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
          //CrashErrorsSegmentEvents().crashed(errorDetails.exceptionAsString());
        };
        PlatformDispatcher.instance.onError = (error, stack) {
          // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          //CrashErrorsSegmentEvents().crashed(error.toString());
          return true;
        };
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }

  }

  // Define an async function to initialize FlutterFire
  static Future<void> _initializeFirebaseServices() async {
    if(!kIsWeb){
      try {
        if (_kTestingCrashlytics) {
          // Force enable crashlytics collection enabled if we're testing it.
          await FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(true);
        } else {
          // Else only enable it in non-debug builds.
          // You could additionally extend this to allow users to opt-in.
          await FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(!kDebugMode);
        }

        if (_kShouldTestAsyncErrorOnInit) {
          await _testAsyncErrorOnInit();
        }
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }
  }

  static Future<void> _testAsyncErrorOnInit() async {
    Future<void>.delayed(const Duration(seconds: 2), () {
      final List<int> list = <int>[];
    });
  }

  static Future<void> _initPerformanceService() async {
    if(!kIsWeb){
      try {
        FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }
  }

}