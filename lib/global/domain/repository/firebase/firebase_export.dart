
export 'package:core_module/global/domain/repository/firebase/firebase_mobile.dart'
  if (dart.library.js) 'package:core_module/global/domain/repository/firebase/firebase_web.dart'
  if (dart.library.io) 'package:core_module/global/domain/repository/firebase/firebase_mobile.dart';