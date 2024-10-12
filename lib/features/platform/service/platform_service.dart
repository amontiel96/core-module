export 'package:core_module/features/platform/domain/usecases/platform_service_mobile.dart'
    if (dart.library.js) 'package:core_module/features/platform/domain/usecases/platform_service_web.dart'
    if (dart.library.io) 'package:core_module/features/platform/domain/usecases/platform_service_mobile.dart';
