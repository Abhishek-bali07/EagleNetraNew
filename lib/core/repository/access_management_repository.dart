import 'dart:io';

import '../common/response.dart';
import '../domain/response/add_accessmange_response.dart';

abstract class AccessManagementRepository{
  Future<Resource<AddAccessResponse>> addAccess(
      String userId,
      String name,
      String mobile,
      String relation,
      File image,
      );
}