import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/position.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/device_data_response.dart';
import 'package:eagle_netra/core/domain/response/kid_lacation_response.dart';

import 'package:eagle_netra/core/domain/response/lat_long_response.dart';
import 'package:eagle_netra/core/domain/response/short_profile_response.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/common/lat_long.dart';
import '../core/domain/response/kid_details_response.dart';
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
  Future<Resource<KidDetailsInfoResponse>> fetchPosition(String userId) async {
    return _dashBoardPageApi
        .selectivePosition(userId)
        .handleResponse<KidDetailsInfoResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //     KidDetailsInfoResponse(
    //       status: true,
    //       message: "Success",
    //       shortDetails: List.generate(2, (index) => ShortDetail(
    //           smartCardId: "bbbbb225",
    //           name: "Sk Rohan",
    //           age: "15",
    //           clsName: "8",
    //           image: "image",
    //           activateFrom: DateTime.parse("2022-12-27 16:10:51"),
    //           deviceId: "4425",
    //           latLongDetails: Kposition(
    //               postionalTime: DateTime.parse("2022-12-27 16:10:51"), posId: "12", latLong: LatLong(lat: 22.882219, lng:  88.014420))
    //
    //       )),
    //
    //
    //     )
    // );
  }

  @override
  Future<Resource<KidDeviceResponse>> deviceData(String posId) async {
    return _dashBoardPageApi
        .selectivePositionDetails(posId)
        .handleResponse<KidDeviceResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(KidDeviceResponse(
    //   status: true,
    //   message: "Success",
    //   name: "Rehana Saha",
    //   image: "",
    //   devicedate: "25th January 2023", devicetime: "15:44pm",
    //   devicelocation: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204",
    //   batteryperformance: "45%", condition: "Good",phone: "7908635232"
    //
    // ));
  }

  @override
  Future<Resource<ShortProfileResponse>> fetchUser(String userId) async {
     return _dashBoardPageApi
         .getUserDetails(userId)
         .handleResponse<ShortProfileResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(ShortProfileResponse(
    //     status: true, message: "Success", shortprofile: ShortProfile(
    //     name: "Vikash Singh", email: "vikash@v-xplore.com", mobile: "8885552222", profileImage: "")
    //
    // ));
  }

  @override
  Future<Resource<KidLocationResponse>> fetchUserLocation(String userId, String querytxt) async {
    return _dashBoardPageApi
        .selectKidsName(userId, querytxt)
        .handleResponse<KidLocationResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //     KidLocationResponse(status: true, message: "Success", kidsDetails:
    //       List.generate(2, (index) => KidsDetail(
    //           name: "name", smartCardId: "2", latLong: LatLong(lat: 22.5654, lng: 88.2365)))
    //     )
    // );
  }

}