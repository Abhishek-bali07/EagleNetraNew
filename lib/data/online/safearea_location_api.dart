import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/add_safe_area_details_reponse.dart';
import '../../core/domain/response/fetch_adress_response.dart';
import '../../core/domain/response/fetch_areadetails_response.dart';
part 'safearea_location_api.g.dart';

@RestApi()
abstract class SafeAreaLocationApi {
  factory SafeAreaLocationApi(Dio dio, {String? baseUrl}) = _SafeAreaLocationApi;




  @GET("${ApiRoutes.parent}/location/address")
  Future<FetchAddressResponse> pointSafearea(
      @Query("lat") double latitude,
      @Query("long") double longitude,
      );




  @POST("${ApiRoutes.parent}/user/{userId}/{smartCardId}/safearea/insert")
  @FormUrlEncoded()
  Future<AddSafeAreaDetailsResponse> setSafeAreaDetails(
      @Path("userId") String userId,
      @Path("smartCardId") String smartCardId,
      @Field( "safe_area_name") String locationName,
      @Field("longitude") double longitude,
      @Field("latitude") double latitude,
      @Field("alert_on_entry") bool valuefirst,
      @Field("alert_on_exit") bool valuesecond,
      @Field("safe_area_radius") double radius,
      @Field("address") String locationAddress,
      @Field("safe_area_id") String safeAreaId,
      );
  
  
  
  @GET("${ApiRoutes.parent}/eagle/getSafeAreaDetails")
  Future<AreaDetailsResponse> editSafearea(
      @Query("smartCardId") String smartCardId,
      @Query("safeAreaId") String safeAreaId,
      );



}