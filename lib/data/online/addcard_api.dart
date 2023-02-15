import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/add_card_response.dart';
import '../../core/domain/response/required_profile_details_reponse.dart';
part 'addcard_api.g.dart';

@RestApi()
abstract class AddcardApi{
  factory AddcardApi(Dio dio, {String? baseUrl}) = _AddcardApi;
  
  @POST("${ApiRoutes.parent}/smartcard/{userId}/insert")
  @FormUrlEncoded()
  Future<AddCardResponse> addCardDetails(
      @Path("userId") String userId,
      @Part(name: "name") String kidname,
      @Part(name: "device_id") String deviceId,
      @Part(name: "card_number") String cardNumber,
      @Part(name: "class") String addCls,
      @Part(name: "age") String age,
      @Part(name: "profile_image") File image,
      @Part(name: "number1") String number1,
      @Part(name: "number2") String number2,
      @Part(name: "number3") String number3
      );





  @GET("${ApiRoutes.parent}/user/{userId}/show")
  Future<FetchProfileDetailsResponse> getUserDetails(
        @Path("userId") String userId
      );

}