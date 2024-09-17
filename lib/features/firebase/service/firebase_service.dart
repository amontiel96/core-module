import 'package:core_module/features/firebase/domain/usecases/firebase_auth.dart';
import 'package:core_module/features/firebase/domain/usecases/firebase_crashlytics.dart';
import 'package:core_module/features/firebase/domain/usecases/firebase_email_verification.dart';
import 'package:core_module/features/firebase/domain/usecases/firebase_init.dart';
import 'package:core_module/features/firebase/domain/usecases/firebase_performance.dart';
import 'package:core_module/features/firebase/domain/usecases/firebase_realtime.dart';
import 'package:flutter/foundation.dart';

class FirebaseService
    with FirebaseInit, FirebaseCrashlyticsService, FirebasePerformanceService, FirebaseAuthService,
        FirebaseEmailVerification{
  FirebaseService._();

  static final FirebaseService instance = FirebaseService._();

  final FirebaseRealtimeService db = FirebaseRealtimeService();

  static Future<void> startServices() async {
    try {
      print("amsdev entro a iniciar los servicios de firebase");
      instance.initCrashlyticsService();
      instance.initPerformanceService();
    } catch (e, s) {
      print("amsdev fallo en inicair los servicios crash performance");
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  static Future<void> initConnection() {
    return instance.start();
  }



}
