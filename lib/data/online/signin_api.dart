import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/otp_verification_response.dart';
import '../../core/domain/response/send_otp_response.dart';

part 'signin_api.g.dart';


@RestApi()
abstract class SignInApi{
  factory SignInApi(Dio dio, {String? baseUrl}) = _SignInApi;

  @POST(ApiRoutes.signin)
  @FormUrlEncoded()
  Future<SendOtpResponse> otpSend(
      @Field("phone_number") String number,
  );


  @GET(ApiRoutes.validateOtp)
  Future<OtpVerificationResponse> validateOtp(
      @Query("phone_number") String number,
      @Query("otp") String otp);

}