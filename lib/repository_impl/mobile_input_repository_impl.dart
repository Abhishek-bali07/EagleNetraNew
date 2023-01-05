import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/mobile_number_code.dart';
import 'package:eagle_netra/core/domain/response/number_code_response.dart';
import 'package:eagle_netra/core/domain/response/send_otp_response.dart';
import 'package:eagle_netra/core/repository/mobile_input_repository.dart';

class MobileInputRepositoryImpl implements MobileInputRepository{
  @override
  Future<Resource<SendOtpResponse>> sendOtp(String number) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        SendOtpResponse(status: true, message: "Success", isSend: true));
  }

}