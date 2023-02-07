import 'dart:io';

import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_accessmange_response.dart';

import '../core/repository/access_management_repository.dart';

class AddAccessManagementUseCaseImpl extends AccessManagementRepository{
  @override
  Future<Resource<AddAccessResponse>> addAccess(String userId, String name, String mobile, String relation, File image) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(AddAccessResponse(
      status: true,
      message: "Success",
      isAdded: true,
    ));
  }

}