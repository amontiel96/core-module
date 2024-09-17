
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';

mixin FirebasePerformanceService{
  Future<void> initPerformanceService() async {
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