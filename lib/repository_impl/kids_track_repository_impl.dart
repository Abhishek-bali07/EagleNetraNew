import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/lat_long_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/common/lat_long.dart';
import '../core/common/position.dart';
import '../core/repository/kids_track_repository.dart';
import '../data/online/kidtrack_api.dart';

class KidsTrackRepositoryImpl implements KidsTrackRepository{
  final Dio _dio;
  late final KidTrackApi _kidTrackApi;

  KidsTrackRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _kidTrackApi = KidTrackApi(_dio);
  }


  @override
  Future<Resource<LatLongResponse>> fetchPositions(
      String smartCardId,
      String date,
      String startTime,
      String endTime) async {
   return _kidTrackApi
       .trackKids(smartCardId, date, startTime, endTime)
       .handleResponse<LatLongResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(LatLongResponse(
    //     status: true,
    //     message: "Success",
    //     latlongData: List.generate(5, (index) => KidPosition(
    //         posId: "1", latLong: LatLong(lat: 22.63355, lng: 88.35533),
    //         postionalTime: DateTime.parse("${index+2}:00PM")))));
  }

}




