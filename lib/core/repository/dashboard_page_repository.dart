import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/device_data_response.dart';
import '../domain/response/lat_long_response.dart';

abstract class DashboardPageRepository{
  Future<Resource<LatLongResponse>> fetchPosition(String userId);
  
  
  Future<Resource<KidDeviceResponse>> deviceData(String posId, String userId);
}