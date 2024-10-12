import 'package:core_module/core_module.dart';
import 'package:core_module/features/permissions/domain/repositories/permission_location_interface.dart';

class PermissionLocationImpl implements PermissionLocationInterface{
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  bool isDeniedForever = false;

  bool positionStreamStarted = false;
  @override
  Future<Map<String, dynamic>> handlePermission()async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return {'status': false, 'type': 'inactive'};
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {


        return {'status': false, 'type': 'denied'};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      isDeniedForever = true;
      return {'status': false, 'type': 'deniedForever'};
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return {'status': true, 'type': 'active'};
  }

  @override
  Future<Position> getCurrentPosition() async{
    final position = await _geolocatorPlatform.getCurrentPosition();
    return position;
  }

  @override
  bool isPermissionDenied(){
  return isDeniedForever;  
  }
}