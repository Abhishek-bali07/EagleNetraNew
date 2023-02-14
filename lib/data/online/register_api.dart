import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/user_register_response.dart';

part 'register_api.g.dart';

@RestApi()
abstract class RegisterApi{
  factory RegisterApi(Dio dio, {String? baseUrl}) = _RegisterApi;

  @POST("${ApiRoutes.parent}/user/{userId}/insert")
  @FormUrlEncoded()
  Future<RegisterUserResponse> submitProfile(
      @Path("userId") String userId,
      @Part(name: "user_name") String name,
      @Part(name: "user_email") String email,
      @Part(name: "profile_image") File image,
      @Part(name: "tracking_for") String selectedPackageId
  );

}
