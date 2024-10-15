library core_module;

//firebase service
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:core_module/features/firebase/service/firebase_service.dart';
export 'package:core_module/features/firebase/service/view/firebase_auth_user.dart';
export 'package:core_module/features/firebase/data/models/firebase_auth_credential_model.dart';
export 'package:firebase_database/firebase_database.dart';
export 'package:firebase_storage/firebase_storage.dart';

//storage service
export 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'package:shared_preferences/shared_preferences.dart';

//constant values
export 'package:core_module/core/usecases/constant_values.dart';
export 'package:core_module/core/utils/formatter.dart';
export 'package:core_module/core/utils/password_pin_validations.dart';
export 'package:core_module/core/constants/states_options_mx.dart';

//localizacion
export 'package:geolocator/geolocator.dart';
export 'package:core_module/features/permissions/service/permission_service.dart';

export 'package:core_module/features/platform/service/platform_service.dart';
export 'package:core_module/features/storage/service/storage_service.dart';
export 'package:core_module/injection_container.dart';