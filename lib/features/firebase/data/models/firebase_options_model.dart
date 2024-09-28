import 'package:firebase_core/firebase_core.dart';

class FirebaseOptionsModel {
  static FirebaseOptions android = const FirebaseOptions(
    apiKey: 'AIzaSyAA4q4n3DT0mRMdy_SYV1yxFSFio-DM6h8',
    appId: '1:51065976324:android:b09623b4ebe0d436d5e751',
    messagingSenderId: '51065976324',
    projectId: 'shonenfit-app',
    storageBucket: 'shonenfit-app.appspot.com',
  );

  static FirebaseOptions ios = const FirebaseOptions(
    apiKey: 'AIzaSyD2n_Nqdgdry1NAbEsICNJD1D2EFXy7Vy8',
    appId: '1:51065976324:ios:2ab9381ef82e10f1d5e751',
    messagingSenderId: '51065976324',
    projectId: 'shonenfit-app',
    storageBucket: 'shonenfit-app.appspot.com',
    iosClientId:
        '51065976324-iq1udrr531rqu2udeksfqia354an11vr.apps.googleusercontent.com',
    iosBundleId: 'ams.app.shonen.fit',
  );

  static FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyApE1CCokEhmPBn99pm705ZNKjeaYbs6gg",
      authDomain: "shonenfit-app.firebaseapp.com",
      databaseURL: "https://shonenfit-app-default-rtdb.firebaseio.com",
      projectId: "shonenfit-app",
      storageBucket: "shonenfit-app.appspot.com",
      messagingSenderId: "51065976324",
      appId: "1:51065976324:web:ff55e643cde8bb12d5e751",
      measurementId: "G-SV8NMBCFDT");
}
