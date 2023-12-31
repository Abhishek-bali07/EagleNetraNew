import 'dart:io';


import 'package:eagle_netra/core/common/package.dart';
import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/user_register_response.dart';

abstract class RegisterUserRepository{



  @override
  Future<Resource<RegisterUserResponse>> registerUser(
      String userId,
      String name,
      String email,
      File image,
      String packageId,

      );
}