import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/app_version_response.dart';
import 'package:eagle_netra/core/domain/response/base_url_response.dart';
import 'package:eagle_netra/core/repository/splash_repository.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/domain/app_version_response.dart';
import '../data/online/base_url_api.dart';
import '../utils/api_client_configuration.dart';

class SplashRepositoryImpl implements SplashRepository{

  final Dio _dio;
  late final BaseUrlApi _baseUrlApi;

  SplashRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _baseUrlApi = BaseUrlApi(_dio);
  }

  @override
  Future<Resource<BaseUrlResponse>> getBaseUrl() async{
    var result = await _baseUrlApi.appBaseUrl()
        .handleResponse<BaseUrlResponse>();
    return result;

    //  await Future.delayed(const Duration(seconds: 2));
   // return Success(BaseUrlResponse(
   //      status: true,
   //      message: "Success",
   //      baseUrl: "https")
   // );




  }

  @override
  Future<Resource<AppVersionResponse>> fetchAppVersion() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(AppVersionResponse(
        status: true,
        message: "Success",
        version: AppVersion(
            message: "Version: 1.0.1",
            code: 1,
            date: "8/6/2022",
            isSkipable: false,
            url:
                'https://play.google.com/store/search?q=farmology+app&c=apps')));
  }

}