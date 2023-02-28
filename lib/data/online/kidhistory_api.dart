import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
part 'kidhistory_api.g.dart';

@RestApi()
abstract  class  KidHistoryApi{
  factory KidHistoryApi(Dio dio, {String? baseUrl}) = _KidHistoryApi;

  @GET("${ApiRoutes.parent}/smartcard/{userId}/show")
  Future<KidDetailsInfoResponse> getKids(
      @Path("userId") String userId
      );



}