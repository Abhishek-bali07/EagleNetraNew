import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/domain/response/kid_details_response.dart';
import '../core/repository/kid_repository.dart';
import '../data/online/kid_details_api.dart';

class KidRepositoryImpl implements KidAccountRepository{

  final Dio _dio;
  late final KidDetailsApi _kidDetailsApi;

  KidRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _kidDetailsApi = KidDetailsApi(_dio);
  }

  @override
  Future<Resource<KidDetailsInfoResponse>> kidShortInfo(String userId) async {
    return _kidDetailsApi
        .getKidDetails(userId)
        .handleResponse<KidDetailsInfoResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //   KidShortInfoResponse(
    //     status: true,
    //     message: "Success", shortDetails: List.generate(3,
    //           (index) => ShortDetails(
    //             kidId: "1",
    //               name: "Druv Sen",
    //               image: "image",
    //               age: "10",
    //               clsname: "Class V",
    //               expiredOn: "31st Dec, 2023",
    //               activateFrom: "1st Jan 2023", deviceId: "2233")),
    //
    //   )
    // );
  }

}

