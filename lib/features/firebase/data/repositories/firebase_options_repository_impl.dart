import 'package:core_module/features/firebase/data/models/firebase_options_model.dart';
import 'package:core_module/features/firebase/domain/repositories/firebase_options_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class FirebaseOptionsRepository implements FirebaseOptionsRepositoryI {
  @override
  FirebaseOptions currentPlatform() {
    if (kIsWeb) {
      return FirebaseOptionsModel.web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FirebaseOptionsModel.android;
      case TargetPlatform.iOS:
        return FirebaseOptionsModel.ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}