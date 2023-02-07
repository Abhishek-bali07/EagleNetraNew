import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/management_history_response.dart';

import '../core/repository/management_history_repository.dart';

class ManagementHistoryRepositoryImpl implements ManagementHistoryRepository{
  @override
  Future<Resource<ManagementShortInfoResponse>> ManagementHistoryInfo(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(ManagementShortInfoResponse(
        status: true,
        message: "Success",
        accessDetails: List.generate(2,
            (index) => AccessDetails(
                name: "Gayetri Saha",
                image: "image",
                relationName: "Mother")

        ),



    ));
  }

}