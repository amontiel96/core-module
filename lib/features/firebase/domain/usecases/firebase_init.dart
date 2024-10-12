import 'package:core_module/features/firebase/data/repositories/firebase_options_repository_impl.dart';
import 'package:core_module/utils/firebase/push_notification_on_backgroud_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:core_module/core_module.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handlerNotification(message);
}


mixin FirebaseInit{

  final FirebaseOptionsRepository _optionsRepository = FirebaseOptionsRepository();

  Future<void> start({String? name}) async {
    try {
      //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      String serviceName =
          'trainUp-app';
      if (kIsWeb) {
        await Firebase.initializeApp(options: _optionsRepository.currentPlatform());
      } else {
        await Firebase.initializeApp(options: _optionsRepository.currentPlatform());
      }
      initEmulator();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  void initEmulator() async{
    try {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      FirebaseDatabase.instance.useDatabaseEmulator('localhost', 9001);
      await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);

     /* await FirebaseAuth.instance.useAuthEmulator('192.168.1.233', 9099);
      FirebaseDatabase.instance.useDatabaseEmulator('192.168.1.233', 9001);
      await FirebaseStorage.instance.useStorageEmulator('192.168.1.233', 9199);*/
      print("amsdev inicio bien el amuladdor");
    }catch(e){
      print("amsdev fallo el amulador: $e");
    }
  }
}