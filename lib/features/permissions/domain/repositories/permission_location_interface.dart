import 'package:core_module/core_module.dart';

abstract class PermissionLocationInterface{
  Future<Map<String, dynamic>> handlePermission();
  Future<Position> getCurrentPosition();
  bool isPermissionDenied();
}