import 'package:geolocator/geolocator.dart';

import '../core/common/gps_status.dart';
import '../core/common/location_permission_status.dart';
import '../core/helpers/location_service.dart';

class AppLocationService implements LocationService {
  @override
  Future<bool> checkIfGpsEnabled() async {
    var isEnabled = await Geolocator.isLocationServiceEnabled();
    return isEnabled;
  }

  Stream<ServiceStatus> gpsStatusStream() =>
      Geolocator.getServiceStatusStream();

  @override
  Stream checkPermission() async* {
    LocationPermission permission;

    var isEnabled = await checkIfGpsEnabled();
    if (!isEnabled) {
      yield GpsStatus.disabled;
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          yield LocationPermissionStatus.showRationale;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        yield LocationPermissionStatus.openSetting;
      } else if (permission == LocationPermission.whileInUse) {
        yield LocationPermissionStatus.accepted;
      } else if (permission == LocationPermission.always) {
        yield LocationPermissionStatus.accepted;
      }
    }
  }


  @override
  Future<Position> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    return position;
  }
}