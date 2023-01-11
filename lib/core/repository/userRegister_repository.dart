import 'dart:io';


import 'package:eagle_netra/core/common/package.dart';

import '../domain/response/user_register_response.dart';

abstract class RegisterUserRepository{
  Future<RegisterUserResponse?> registerUser(
      String mobile,
      String name,
      String email,
      File image,
      String packageId,

      );
}