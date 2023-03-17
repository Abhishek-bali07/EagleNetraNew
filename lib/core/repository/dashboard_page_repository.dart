import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/device_data_response.dart';
import '../domain/response/kid_details_response.dart';
import '../domain/response/kid_lacation_response.dart';
import '../domain/response/lat_long_response.dart';
import '../domain/response/short_profile_response.dart';

abstract class DashboardPageRepository{

  Future<Resource<KidLocationResponse>> fetchUserLocation(String userId, String querytxt);

  Future<Resource<ShortProfileResponse>> fetchUser(String userId);

  Future<Resource<KidDetailsInfoResponse>> fetchPosition(String userId);
  
  
  Future<Resource<KidDeviceResponse>> deviceData(String posId);
}