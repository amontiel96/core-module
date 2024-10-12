
import 'package:core_module/features/permissions/domain/usecases/permission_location.dart';

class PermissionCoreService
    with PermissionCoreLocation{
  PermissionCoreService._();

  static final PermissionCoreService instance = PermissionCoreService._();

}
