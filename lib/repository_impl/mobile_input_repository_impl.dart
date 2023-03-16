import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/mobile_number_code.dart';
import 'package:eagle_netra/core/domain/response/number_code_response.dart';
import 'package:eagle_netra/core/domain/response/otp_verification_response.dart';
import 'package:eagle_netra/core/domain/response/send_otp_response.dart';
import 'package:eagle_netra/core/repository/mobile_input_repository.dart';
import 'package:eagle_netra/utils/extensions.dart';
import '../data/online/signin_api.dart';
import '../utils/api_client_configuration.dart';

class MobileInputRepositoryImpl implements MobileInputRepository{

  final Dio _dio;
  late final SignInApi _signInApi;

  MobileInputRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _signInApi = SignInApi(_dio);
  }

  @override
  Future<Resource<SendOtpResponse>> sendOtp(String number) async {
    return _signInApi
        .otpSend(number)
        .handleResponse<SendOtpResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //     SendOtpResponse(
    //         status: true,
    //         message: "Success",
    //         isSend: true, otp: "2222"));
  }

  @override
  Future<Resource<OtpVerificationResponse>> verifyOtp(String number, String otp) async{
    return _signInApi
        .validateOtp(number, otp)
        .handleResponse<OtpVerificationResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(OtpVerificationResponse(
    //     status: true,
    //     message: "OTP Matched",
    //     isVerified: true,
    //     userId: "1",
    //     userStatus:"REGISTERED", details: []));
  }

}