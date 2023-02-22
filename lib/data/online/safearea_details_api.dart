import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/activate_switch_response.dart';
import '../../core/domain/response/safe_area_response.dart';

part 'safearea_details_api.g.dart';

@RestApi()
abstract class SafeAreaDetailsApi{
  factory SafeAreaDetailsApi(Dio dio, {String? baseUrl}) = _SafeAreaDetailsApi;


  @GET("${ApiRoutes.parent}/user/{userId}/kid/safe_area")
  Future<SafeareaResponse> getSafeAreaDetails(
      @Path("userId") String userId,
      @Query("smart_card_id") String smartCardId,
      );


  @POST("${ApiRoutes.parent}/user/safearea/status")
  Future<ActivateSwitchResponse> getToggle(
      @Query("safeAreaId") String safeAreaId,
      );
}