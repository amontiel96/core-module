import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

mixin FirebaseCrashlyticsService {
  // Toggle this to cause an async error to be thrown during initialization
  // and to test that runZonedGuarded() catches the error

  // Toggle this for testing Crashlytics in your app locally.
  static const _kTestingCrashlytics = true;

  Future<void> initCrashlyticsService() async {
    if (!kIsWeb) {
      try {
        // Pass all uncaught errors from the framework to Crashlytics.
        FlutterError.onError = (errorDetails) {
          print("amsdev detecto error1");
          // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
          //CrashErrorsSegmentEvents().crashed(errorDetails.exceptionAsString());
        };
        PlatformDispatcher.instance.onError = (error, stack) {
          print("amsdev detecto error2");
          // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          //CrashErrorsSegmentEvents().crashed(error.toString());
          return true;
        };
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
      _initializeFirebaseServices();
    }
  }

  // Define an async function to initialize FlutterFire
  Future<void> _initializeFirebaseServices() async {
    if (!kIsWeb) {
      try {
        if (_kTestingCrashlytics) {
          print("amsdev entro a enviar los eventos de crash");
          // Force enable crashlytics collection enabled if we're testing it.
          await FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(true);
        } else {
          // Else only enable it in non-debug builds.
          // You could additionally extend this to allow users to opt-in.
          await FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(!kDebugMode);
        }
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }
  }
}
