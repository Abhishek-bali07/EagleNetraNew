import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';
import 'package:eagle_netra/presentation/screens/kids_history.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/domain/response/kid_details_response.dart';
import '../core/repository/kidshistory_repository.dart';
import '../data/online/kidhistory_api.dart';

class KidsHistoryRepositoryImpl implements KidsHistoryRepository{
   final Dio _dio;
   late final KidHistoryApi _kidHistoryApi;

   KidsHistoryRepositoryImpl(this._dio){
     _dio.options = ApiClientConfiguration.initialConfiguration;
     _kidHistoryApi = KidHistoryApi(_dio);
   }

  @override
  Future<Resource<KidDetailsInfoResponse>> kidsHistoryInfo(String userId) async {
   return _kidHistoryApi
       .getKids(userId)
       .handleResponse<KidDetailsInfoResponse>();
     // await Future.delayed(const Duration(seconds: 2));
    // return Success(KidShortInfoResponse(
    //   status: true,
    //   message: "Success", shortDetails: List.generate(2,
    //         (index) => ShortDetails(
    //         smartCardId: "1",
    //         name: "Rehana Saha",
    //         image: "image",
    //         age: "10",
    //         clsName: "Class V",
    //         activateFrom: "1st Jan 2023", deviceId: "2233")),
    //
    //
    // ));
  }

}