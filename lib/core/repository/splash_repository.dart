import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/base_url_response.dart';

import '../domain/response/app_version_response.dart';

abstract class SplashRepository{

  Future<Resource<BaseUrlResponse>> getBaseUrl();

  Future<Resource<AppVersionResponse>> fetchAppVersion();
}