import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/base_url_response.dart';

part 'base_url_api.g.dart';


@RestApi()
abstract class BaseUrlApi {
  factory BaseUrlApi(Dio dio, {String? baseUrl}) = _BaseUrlApi;


  @GET(ApiRoutes.baseUrl)
  Future<BaseUrlResponse> appBaseUrl();


}