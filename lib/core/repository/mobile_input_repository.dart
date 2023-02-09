import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/send_otp_response.dart';
import '../domain/response/otp_verification_response.dart';

abstract class MobileInputRepository{
    Future<Resource<SendOtpResponse>> sendOtp(String number);

    Future<Resource<OtpVerificationResponse>> verifyOtp(String number, String otp);
}