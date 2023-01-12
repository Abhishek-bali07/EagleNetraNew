import 'dart:io';

import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/user_register_response.dart';
import 'package:eagle_netra/core/repository/userRegister_repository.dart';

class RegisterUserUseCaseImpl extends RegisterUserRepository{
  @override
  Future<Resource<RegisterUserResponse>> registerUser(String mobile, String name, String email, File image, String selectedPackageId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RegisterUserResponse(
        status: true,
        message: "Success",
        isVerified: true,
        userId: "1",
        userStatus:"REGISTERED"));
  }

}