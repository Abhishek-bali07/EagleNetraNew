import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_safe_area_details_reponse.dart';

import 'package:eagle_netra/core/domain/response/fetch_adress_response.dart';
import 'package:eagle_netra/core/domain/response/safe_area_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/domain/response/fetch_areadetails_response.dart';
import '../core/repository/safearea_details_repository.dart';
import '../data/online/safearea_location_api.dart';



class SafeareaDetailsUseCaseImpl extends SafeAreaDetailsRepository{
  final Dio _dio;
  late final SafeAreaLocationApi _safeAreaLocationApi;


  SafeareaDetailsUseCaseImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _safeAreaLocationApi =SafeAreaLocationApi(_dio);
  }


  @override
  Future<Resource<FetchAddressResponse>> fetchAddress( double latitude,double longitude) async {
    return _safeAreaLocationApi
        .pointSafearea(latitude,longitude)
        .handleResponse<FetchAddressResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(FetchAddressResponse(
    //   status: true,
    //   message: "Success",
    //   locationDetails: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204"
    // ));
  }

  @override
  Future<Resource<AddSafeAreaDetailsResponse>> uploadLocationDetails(
      String userId,
      String smartCardId,
      double latitude,
      double longitude,
      String locationName,
      String locationAddress,
      bool valuefirst,
      bool valuesecond,
      double radius,
      String safeAreaId) async {
    return _safeAreaLocationApi
        .setSafeAreaDetails(userId, smartCardId, locationName, longitude, latitude, valuefirst, valuesecond, radius, locationAddress,safeAreaId)
        .handleResponse<AddSafeAreaDetailsResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(AddSafeAreaDetailsResponse(
    //     status: true,
    //     message: "Success",
    //     isSaved: true
    // ));
  }

  @override
  Future<Resource<AreaDetailsResponse>> fetchSafeAreaDetails(String smartCardId, String  safeAreaId) async {
    return _safeAreaLocationApi
        .editSafearea(smartCardId, safeAreaId)
        .handleResponse<AreaDetailsResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(AreaDetailsResponse(status: true, message: "Success",
    //     safeAreaDetails: SafeAreaDetails(
    //          locationName: "locationName", address:" address", radius: 60.352, state: "state", alertOn:" alertOn", latLong: LatLong(lat: 22.5632, lng: 88.235469), safeAreaId: '1')
    //
    // ));
  }

}