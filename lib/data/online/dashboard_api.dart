import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/required_profile_details_reponse.dart';
part 'dashboard_api.g.dart';

@RestApi()
abstract class DashBoardPageApi{
  factory DashBoardPageApi(Dio dio, {String? baseUrl}) = _DashBoardPageApi;

  @GET("${ApiRoutes.parent}/user/{userId}/show")
  Future<FetchProfileDetailsResponse> getUserDetails(
      @Path("userId") String userId
      );


}