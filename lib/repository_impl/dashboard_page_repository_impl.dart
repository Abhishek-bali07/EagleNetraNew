import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/position.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/device_data_response.dart';

import 'package:eagle_netra/core/domain/response/lat_long_response.dart';
import 'package:eagle_netra/core/domain/response/short_profile_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/common/lat_long.dart';
import '../core/repository/dashboard_page_repository.dart';
import '../data/online/dashboard_api.dart';
import '../utils/api_client_configuration.dart';

class DashboardPageUseCaseImpl extends DashboardPageRepository{
  final Dio _dio;
  late final DashBoardPageApi _dashBoardPageApi;

  DashboardPageUseCaseImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _dashBoardPageApi = DashBoardPageApi(_dio);
 }


  @override
  Future<Resource<LatLongResponse>> fetchPosition(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(LatLongResponse(
        status: true,
        message: "Success",
        latlongData: List.generate(1, (index) => KidPosition(
            posId: "1", latLong:LatLong(lat: 22.63355, lng:  88.35533), postionalTime: ""
          
        )
        
        ),

    ));
  }

  @override
  Future<Resource<KidDeviceResponse>> deviceData(String posId, String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(KidDeviceResponse(
      status: true,
      message: "Success",
      name: "Rehana Saha",
      image: "",
      devicedate: "25th January 2023", devicetime: "15:44pm",
      devicelocation: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204",
      batteryperformance: "45%", condition: "Good",phone: "7908635232"

    ));
  }

  @override
  Future<Resource<ShortProfileResponse>> fetchUser(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(ShortProfileResponse(
        status: true, message: "Success", shortprofile: ShortProfile(
        name: "Vikash Singh", email: "vikash@v-xplore.com", mobile: "8885552222", profileImage: "")

    ));
  }

}