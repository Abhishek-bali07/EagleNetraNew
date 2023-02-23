import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/lat_long_response.dart';
part 'kidtrack_api.g.dart';

@RestApi()
abstract class KidTrackApi{
  factory KidTrackApi(Dio dio , {String? baseUrl}) = _KidTrackApi;


  @GET("${ApiRoutes.parent}/location/date/history")
  Future<LatLongResponse> trackKids(
      @Query("smartCardId") String smartCardId,
      @Query("date") String date,
      @Query("startTime") String startTime,
      @Query("endTime") String endTime,
      );



}