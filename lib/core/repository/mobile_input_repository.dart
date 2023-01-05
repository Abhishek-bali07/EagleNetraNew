import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/number_code_response.dart';
import 'package:eagle_netra/core/domain/response/send_otp_response.dart';

abstract class MobileInputRepository{
    Future<Resource<SendOtpResponse>> sendOtp(String number);
}