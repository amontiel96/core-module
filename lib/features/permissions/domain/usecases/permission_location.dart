import 'package:core_module/core_module.dart';
import 'package:core_module/features/permissions/data/repositories/permission_location.dart';

mixin PermissionCoreLocation {
  final PermissionLocationImpl _repository = PermissionLocationImpl();

  Future<Map<String, dynamic>> handlePermission() async {
    return await _repository.handlePermission();
  }

  Future<Position> getCurrentPosition() async {
    return await _repository.getCurrentPosition();
  }
  
  bool isPermissionDenied() => _repository.isPermissionDenied();
}
