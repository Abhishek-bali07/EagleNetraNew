import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/safe_area_response.dart';

part 'safearea_details_api.g.dart';

@RestApi()
abstract class SafeAreaDetailsApi{
  factory SafeAreaDetailsApi(Dio dio, {String? baseUrl}) = _SafeAreaDetailsApi;


  @GET("${ApiRoutes.parent}/user/{userId}/{smartCardId}/safearea/show")
  Future<SafeareaResponse> getSafeAreaDetails(
      @Path("userId") String userId,
      @Path("smartCardId") String smartCardId,
      );

}