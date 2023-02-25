import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/management_history_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/repository/management_history_repository.dart';
import '../data/online/management_history_api.dart';

class ManagementHistoryRepositoryImpl implements ManagementHistoryRepository{
  final Dio _dio;
  late final ManagementHistoryApi _managementHistoryApi;

  ManagementHistoryRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _managementHistoryApi = ManagementHistoryApi(_dio);
  }

  @override
  Future<Resource<ManagementShortInfoResponse>> ManagementHistoryInfo(String userId) async {
    return _managementHistoryApi
        .getAccessDetails(userId)
        .handleResponse<ManagementShortInfoResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(ManagementShortInfoResponse(
    //     status: true,
    //     message: "Success",
    //     accessDetails: List.generate(2,
    //         (index) => AccessDetails(
    //             name: "Gayetri Saha",
    //             image: "image",
    //             relationName: "Mother")
    //
    //     ),
    //
    //
    //
    // ));
  }

}