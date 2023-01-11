import 'dart:io';

import 'package:eagle_netra/core/domain/response/user_register_response.dart';
import 'package:eagle_netra/core/repository/userRegister_repository.dart';

class RegisterUserUseCaseImpl extends RegisterUserRepository{
  @override
  Future<RegisterUserResponse?> registerUser(String mobile, String name, String email, File image, String selectedPackageId) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}