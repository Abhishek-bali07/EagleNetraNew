import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/user_register_response.dart';
import 'package:eagle_netra/core/repository/userRegister_repository.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../data/online/register_api.dart';

class RegisterUserUseCaseImpl implements RegisterUserRepository{
  final Dio _dio;
  late final RegisterApi _registerApi;

  RegisterUserUseCaseImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _registerApi = RegisterApi(_dio);
  }


  @override
  Future<Resource<RegisterUserResponse>> registerUser(
      String userId,
      String name,
      String email,
      File image,
      String selectedPackageId) async {
    return _registerApi
        .submitProfile(userId, name, email, image, selectedPackageId)
        .handleResponse<RegisterUserResponse>();
  }

}