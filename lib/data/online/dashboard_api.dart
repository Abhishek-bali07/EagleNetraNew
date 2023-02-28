import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/device_data_response.dart';
import '../../core/domain/response/lat_long_response.dart';
import '../../core/domain/response/required_profile_details_reponse.dart';
import '../../core/domain/response/short_profile_response.dart';
part 'dashboard_api.g.dart';

@RestApi()
abstract class DashBoardPageApi{
  factory DashBoardPageApi(Dio dio, {String? baseUrl}) = _DashBoardPageApi;

  @GET("${ApiRoutes.parent}/user/{userId}/show")
  Future<ShortProfileResponse> getUserDetails(
      @Path("userId") String userId
      );


  // @GET("${ApiRoutes.parent}/smartcard/{smartCardId}/location/history")
  // Future<LatLongResponse> selectivePosition(
  //     @Path("userId") String userId,
  //     );

   @GET("${ApiRoutes.parent}/eagle/getKidsDetails")
   Future<LatLongResponse> selectivePosition(
    @Query("userId") String userId,
   );
  
  @GET("${ApiRoutes.parent}/device/details")
  Future<KidDeviceResponse> selectivePositionDetails(
      @Query("posId") String posId
      );


}