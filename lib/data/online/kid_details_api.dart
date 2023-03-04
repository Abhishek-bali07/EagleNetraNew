import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
part 'kid_details_api.g.dart';

@RestApi()
abstract class KidDetailsApi{
  factory KidDetailsApi(Dio dio, {String? baseUrl}) = _KidDetailsApi;

  @GET("${ApiRoutes.parent}/eagle/getKidsDetails")
  Future<KidDetailsInfoResponse> getKidDetails(
      @Query("userId") String userId,
      );
}