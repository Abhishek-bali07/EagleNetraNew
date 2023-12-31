import 'dart:ffi';
import 'dart:ui';

import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/core/domain/response/safe_area_response.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/common/service.dart';
import '../../core/common/track_alert_button.dart';



import '../../core/domain/response/fetch_areadetails_response.dart';
import '../../core/domain/response/kid_details_response.dart';

import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/safearea_details_repository.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/my_utils.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';
import 'main_view_model.dart';

part 'add_safe_area_view_model.g.dart';

class AddSafeAreaPageViewModel = _AddSafeAreaPageViewModel
    with _$AddSafeAreaPageViewModel;

abstract class _AddSafeAreaPageViewModel with Store {
  final mainVM = instance<MainViewModel>();
  final _appSettings = instance<AppSettings>();
  final messageInformer = MessageInformer();
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();
  final add_safe_area_use_case = instance<SafeAreaDetailsRepository>();

  ShortDetail data;

  AreaDetails? safearea;

  @observable
  SafeAreaDetails? editSafeArea;

  @observable
  bool isLoading = false;

  @observable
  bool gettingDataLoader = false;

  @observable
  bool sendingLoader = false;

  @observable
  bool isShow = false;

  Marker? _marker;

  @observable
  Set<Marker> markers = {};

  Circle? _circle;

  @observable
  Set<Circle> circles = {};

  // @observable
  // AlertRadio selected = AlertRadio.none;

  @observable
  String alertSelected = "";

  @observable
  bool uploadingLoader = false;

  @observable
  bool isLoader = false;

  @observable
  String locationAddress = "";

  @observable
  String locationNamePrefilled = "";

  @observable
  String locationName = "";

  @observable
  String image = "";

  @observable
  double radius = 500;

  @observable
  bool valuefirst = false;

  @observable
  bool valuesecond = false;

  @action
  onNameChanged(String value) {
    locationName = value;
  }

  @action
  onRetry(AlertAction? action) {}

  _AddSafeAreaPageViewModel(this.data, this.safearea) {
    mainVM.getCurrentLocation();
    getSafeAreaData();
  }

  @action
  setupCircle(LatLong coordinate) {
    Set<Circle> getCircles = {};
    _circle = Circle(
        circleId: CircleId("${coordinate.hashCode}"),
        center: LatLng(coordinate.lat, coordinate.lng),
        radius: radius,
        fillColor: Colors.green.withOpacity(0.1),
        strokeWidth: 2,
        strokeColor: Colors.black45);
    getCircles.add(_circle!);
    circles = getCircles;
  }

  @action
  setupMarker(LatLong coordinate) async {
    Set<Marker> getMarkers = {};
    _marker = Marker(
      anchor: const Offset(0.5, 0.5),
      markerId: MarkerId("${coordinate.hashCode}"),
      position: LatLng(coordinate.lat, coordinate.lng),
      consumeTapEvents: false,
      draggable: true,
      onTap: onNext,
      icon: BitmapDescriptor.defaultMarker,
    );
    if (_marker != null) {
      getMarkers.add(_marker!);
      getLocationName(coordinate);
      markers = getMarkers;
      setupCircle(coordinate);
    }
  }

  @action
  onNext() async {
    isShow = !isShow;
  }

  @action
  getLocationName(LatLong coordinate) async {
    double Longitude = coordinate.lng;
    double Latitude = coordinate.lat;
    isLoader = true;
    var response =
        await add_safe_area_use_case.fetchAddress(Latitude, Longitude);
    if (response is Success) {
      var data = response.data;
      isLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data != null) {
            locationAddress = data.locationDetails;
          }
      }
    }
  }

  @action
  setRadius(double r) {
    radius = r;
  }

  @action
  onCheckFirst(bool? value) {
    if (value != null) {
      valuefirst = value;
    }
  }

  @action
  onCheckSecond(bool? value) {
    if (value != null) {
      valuesecond = value;
    }
  }


  @action
  addNow() async {
    var latitude = _marker?.position.latitude;
    var longitude = _marker?.position.longitude;
    uploadingLoader = true;
    var userId = _appSettings.userId;
    var smartCardId = data.smartCardId;
    var safeAreaId = safearea?.safeAreaId;
    debugPrint("Datasafearea:$safeAreaId");
    var response = await add_safe_area_use_case.uploadLocationDetails(
        userId,
        smartCardId,
        latitude!,
        longitude!,
        locationName,
        locationAddress,
        valuefirst,
        valuesecond,
        radius,
        safeAreaId??""
    );
    if (response is Success) {
      var data = response.data;
      uploadingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isSaved) {
            MyUtils.toastMessage(data.message);
            _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.dashboard);
           // _navigator.popAndNavigateTo(Routes.dashboard);
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.okay,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none, action: AlertAction.none)));
          }
          break;
        default:
      }
    } else if (response is Error) {
      uploadingLoader = false;
    }
  }



  @action
  getSafeAreaData() async{
    isLoading = true;
    var smartCardId = data.smartCardId;
    var safeAreaId = safearea!.safeAreaId;
    var response =  await add_safe_area_use_case.fetchSafeAreaDetails(smartCardId,safeAreaId);
    if(response is Success){
      var data = response.data;
      isLoading = false;
      switch(data != null && data.status){
        case true:
          if(data != null){
            editSafeArea = data.safeAreaDetails;
            radius = data.safeAreaDetails.radius;
            alertSelected = data.safeAreaDetails.alertOn;
            locationAddress = data.safeAreaDetails.address;
            locationNamePrefilled = data.safeAreaDetails.locationName;
            if (data.safeAreaDetails.latLong != null) {
              await setupMarker(data.safeAreaDetails.latLong);
            }
          }

      }
    }
  }

  CameraPosition initialCameraPosition() {
    if (mainVM.currentLocation != null) {
      return CameraPosition(
        target: LatLng(mainVM.currentLocation?.latitude ?? 0,
            mainVM.currentLocation?.longitude ?? 0),
        zoom: 16,
      );
    } else {
      return Constants.defaultCameraPosition;
    }
  }

  Future<bool> backToPrevious() async{
    // _navigator.popAndNavigateTo(Routes.safearea);
    //_navigator.pop();
    _navigator.navigatorKey.currentState!.popUntil((route) => route.isFirst );
    return false;
  }
}
