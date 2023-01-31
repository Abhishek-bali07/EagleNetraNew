import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/common/batch_call_command.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/helpers/check_internet.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/core/repository/splash_repository.dart';
import 'package:eagle_netra/presentation/app_navigator/di.dart';
import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/connectivity_state.dart';
import 'package:eagle_netra/utils/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/version.dart';
import 'package:flutter_mobx/version.dart';
import 'package:flutter_mobx/version.dart';
import 'package:flutter_mobx/version.dart';
import 'package:flutter_mobx/version.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';



part 'splashpage_view_model.g.dart';

class SplashViewModel = _SplashViewModel with _$SplashViewModel;


abstract class _SplashViewModel with Store, CheckInternet{
  final _navigator = instance<NavigationService>();
  final  _splashrepo = instance<SplashRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();

  @observable
  ConnectivityState connectivityState = ConnectivityState.Neutral;

  @observable
  var packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');

  @observable
  BatchCallCommand batchCall = BatchCallCommand.neutral;

  _SplashViewModel() {
    _initPackageInfo();
    _getBaseUrl();
    checkNow((connectivityState) {
      switch (connectivityState) {
        case ConnectivityState.Gained:
          _getBaseUrl();
          _changeConnectivity(connectivityState);
          break;
        case ConnectivityState.Gone:
          _changeConnectivity(connectivityState);
          break;
        case ConnectivityState.Neutral:
          _changeConnectivity(connectivityState);
          break;
      }
    });
  }


  @action
  _changeConnectivity(ConnectivityState connectivityState) {
    this.connectivityState = connectivityState;
  }

  @action
  _initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }




  @action
  _getBaseUrl() async {
    var response = await _splashrepo.getBaseUrl();
    if(response is Success){
      var data = response.data;
      switch(data != null && data.status){
        case true:
          _appSettings.setBaseUrl(data!.baseUrl);
          _navigator.navigateTo(Routes.slider);
          
          break;
        default:
      }
    }
  }







  @action
  _checkAppVersion() async {
    var response = await _splashrepo.fetchAppVersion();
    if (response is Success) {
      var data = response.data;

      switch (data != null && data.status) {
        case true:
          if (int.parse(packageInfo.buildNumber) < data!.version.code) {
            dialogManager.initData(AlertData(
                StringProvider.appUpdate,
                null,
                StringProvider.appId,
                data.version.message,
                StringProvider.okay,
                StringProvider.notYet,
                null,
                data.version)
            );
          } else {
            batchCall = BatchCallCommand.initiate;
          }
      }
    }
  }

}

