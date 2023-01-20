import 'dart:async';

import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/intro_data.dart';
import 'package:eagle_netra/core/domain/response/intro_data_response.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/repository/main_repository.dart';


import 'package:eagle_netra/presentation/app_navigator/di.dart';
import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/utils/dialog_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_data.dart';
import '../../core/common/gps_status.dart';
import '../../core/common/location_permission_status.dart';
import '../../core/helpers/string_provider.dart';
import '../../helpers_impl/app_location_service.dart';


part 'main_view_model.g.dart';

class MainViewModel = _IMainViewModel with _$MainViewModel;


abstract class _IMainViewModel with Store {
  final _prefs = instance<AppSettings>();
  final _repository = instance<MainRepository>();
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();
  final locationService = AppLocationService();


  @observable
  bool gettingIntroDataLoader = false;

  List<IntroData> introPageData = [];

  @action
  getIntroPageData() async{
    // gettingIntroDataLoader =  true;
    // var response = await _repository.getIntroPageData();
    // if(response is Success){
    //   var data = response.data;
    //   switch (data != null && data.status) {
    //     case true:
    //       var introDataResponse = data!.responses.first;
    //       gettingIntroDataLoader = false;
    //       if (introDataResponse is IntroDataResponse) {
    //         if (introDataResponse.status) {
    //           _prefs.introComplete(true);
    //           introPageData = introDataResponse.introData;
    //
    //         }
    //       }
    //   }
    // }
  }

  @observable
  Position? currentLocation;

  StreamSubscription? locationStreamDisposer;

  @action
  getCurrentLocation() async {
    locationStreamDisposer =
        locationService.checkPermission().listen((event) async {
          debugPrint("locationService $event");
          if (event == GpsStatus.disabled) {

          } else if (event == LocationPermissionStatus.showRationale) {

          } else if (event == LocationPermissionStatus.openSetting) {

          } else {
            currentLocation = await locationService.getCurrentLocation();
          }
        });
  }

}