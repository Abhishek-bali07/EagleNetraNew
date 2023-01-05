import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/base_url_response.dart';
import 'package:eagle_netra/core/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository{
  @override
  Future<Resource<BaseUrlResponse>> getBaseUrl() async{
    await Future.delayed(const Duration(seconds: 2));
   return Success(BaseUrlResponse(
        status: true,
        message: "Success",
        baseUrl: "https", version: "1.0.1" ));




  }

}