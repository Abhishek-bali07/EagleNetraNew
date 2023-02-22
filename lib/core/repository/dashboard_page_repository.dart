import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/device_data_response.dart';
import '../domain/response/lat_long_response.dart';
import '../domain/response/short_profile_response.dart';

abstract class DashboardPageRepository{

  Future<Resource<ShortProfileResponse>> fetchUser(String userId);

  Future<Resource<LatLongResponse>> fetchPosition(String smartCardId);
  
  
  Future<Resource<KidDeviceResponse>> deviceData(String posId);
}