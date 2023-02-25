import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/management_history_response.dart';
part 'management_history_api.g.dart';

@RestApi()
abstract class ManagementHistoryApi{
  factory ManagementHistoryApi(Dio dio, {String? baseUrl}) = _ManagementHistoryApi;


   @GET("${ApiRoutes.parent}/Eagle/getSecondaryParent")
  Future<ManagementShortInfoResponse> getAccessDetails(
       @Query("userId") String userId,
       );
}