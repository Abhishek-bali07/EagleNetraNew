import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/activate_switch_response.dart';


import 'package:eagle_netra/core/domain/response/safe_area_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/repository/safearea_repository.dart';
import '../data/online/safearea_details_api.dart';

class SafeareaRepositoryImpl implements SafeAreaRepository{

  final Dio _dio;
  late final SafeAreaDetailsApi _safeAreaDetailsApi;

  SafeareaRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _safeAreaDetailsApi = SafeAreaDetailsApi(_dio);
  }


  @override
  Future<Resource<SafeareaResponse>> kidShortInfo(String userId, String smartCardId) async {
  return _safeAreaDetailsApi
      .getSafeAreaDetails(userId, smartCardId)
      .handleResponse<SafeareaResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //     SafeareaResponse(
    //       status: true,
    //       message: "Success",
    //       areaDetails: List.generate(1, (index) => AreaDetails(
    //           locationName: "Rehana School",
    //           address: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204",
    //           radius: "100m",
    //           alertOn: "Entry & Exit",
    //           state: true, safeAreaId: '',))
    //     )
    // );
  }

  @override
  Future<Resource<ActivateSwitchResponse>> AddSafearea(String userId, String smartCardId, String safeAreaId, bool state) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
      ActivateSwitchResponse(
        status: true,
        message: "Success",
        isActivate: true,
        
        
      )
    );
  }

 


}