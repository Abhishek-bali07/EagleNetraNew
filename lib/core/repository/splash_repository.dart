import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/base_url_response.dart';

abstract class SplashRepository{
  // Future<Resource<>> fetchAppVersion();
  Future<Resource<BaseUrlResponse>> getBaseUrl();
}