import 'package:firebase_core/firebase_core.dart';

class FirebaseOptionsModel {
  static FirebaseOptions android = const FirebaseOptions(
    apiKey: 'AIzaSyAWFRbMA5WKBQ6lEtM5RnNcJ9kjQJKmN80',
    appId: '1:1008274796828:android:6e261ae5217c35563c8ad9',
    messagingSenderId: '1008274796828',
    projectId: 'pokemon-app-ams',
    storageBucket: 'pokemon-app-ams.firebasestorage.app',
  );

  static FirebaseOptions ios = const FirebaseOptions(
    apiKey: 'AIzaSyAHi7yj9g33xFzpXPrWSyC0PlSQRMEgkKU',
    appId: '1:1008274796828:ios:7b57035482e95e2d3c8ad9',
    messagingSenderId: '1008274796828',
    projectId: 'pokemon-app-ams',
    storageBucket: 'pokemon-app-ams.firebasestorage.app',
    iosBundleId: 'ams.api.pokemon.app',
  );

  static FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyDhx4__reqKvhZbzStMEx4-b8Yp3qZutqE",
      authDomain: "pokemon-app-ams.firebaseapp.com",
      databaseURL: "https://pokemon-app-ams-default-rtdb.firebaseio.com",
      projectId: "pokemon-app-ams",
      storageBucket: "pokemon-app-ams.firebasestorage.app",
      messagingSenderId: "1008274796828",
      appId: "1:1008274796828:web:2aa40b33624f129b3c8ad9",
      measurementId: "G-Y2D7RYGZM1");
}
