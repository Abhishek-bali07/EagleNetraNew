import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_accessmange_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/repository/access_management_repository.dart';
import '../data/online/accessmanagement_api.dart';

class AddAccessManagementUseCaseImpl implements AccessManagementRepository{
  final Dio _dio;
  late final AccessManagementApi _accessManagementApi;

  AddAccessManagementUseCaseImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _accessManagementApi = AccessManagementApi(_dio);
  }

  @override
  Future<Resource<AddAccessResponse>> addAccess(
      String userId,
      String name,
      String mobile,
      String relation,
      File image) async {
    return _accessManagementApi
        .addAccessDetails(userId, name, mobile, relation, image)
        .handleResponse<AddAccessResponse>();



    //await Future.delayed(const Duration(seconds: 2));
    // return Success(AddAccessResponse(
    //   status: true,
    //   message: "Success",
    //   isAdded: true,
    // ));
  }

}