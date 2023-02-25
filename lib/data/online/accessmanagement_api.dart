import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/add_accessmange_response.dart';
part 'accessmanagement_api.g.dart';

@RestApi()
abstract class AccessManagementApi{
  factory AccessManagementApi(Dio dio, {String? baseUrl}) = _AccessManagementApi;

  @POST("${ApiRoutes.parent}/user/{userId}/secondary/insert")
  @FormUrlEncoded()
  Future<AddAccessResponse> addAccessDetails(
      @Path("userId") String userId,
      @Part(name: "name") String name,
      @Part(name: "number") String mobile,
      @Part(name: "relationship") String relation,
      @Part(name: "profile_image") File image,
      );



}