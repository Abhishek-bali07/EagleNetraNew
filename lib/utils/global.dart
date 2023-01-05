import 'dart:io';

import 'package:eagle_netra/core/common/app_constants.dart';
import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/presentation/app_navigator/di.dart';

class Global {
  Global._();

  static String getPlatform() {
    if (Platform.isAndroid) {
      return AppConstants.android;
    } else if (Platform.isIOS) {
      return AppConstants.ios;
    }
    return AppConstants.unknownPlatform;
  }

  static String get baseUrl {
    return instance<AppSettings>().baseUrl;
  }
}
