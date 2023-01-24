import 'dart:ffi';
import 'dart:ui';

import 'package:eagle_netra/core/common/lat_long.dart';
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
import '../../core/domain/response/fetch_adress_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/safearea_details_repository.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/my_utils.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';
import 'main_view_model.dart';



part 'add_safe_area_view_model.g.dart';

class AddSafeAreaPageViewModel = _AddSafeAreaPageViewModel with _$AddSafeAreaPageViewModel;


abstract class _AddSafeAreaPageViewModel with Store{
  final mainVM = instance<MainViewModel>();
  final _prefs = instance<AppSettings>();
  final messageInformer = MessageInformer();
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();
  final add_safe_area_use_case = instance<SafeAreaDetailsRepository>();

  ShortDetails? data;

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


  @observable
  AlertRadio selected = AlertRadio.none;

  @observable
  String alertSelected = "";

  @observable
  bool uploadingLoader = false;

  @observable
  bool isLoader = false;


  @observable
  LocationDetails? locationAddress;

  @observable
  String locationName = "";

  @observable
  String userId = "1ab";
  //
  @observable
  String kidId = "333";

  @observable
  double radius = 500;

  @action
  onNameChanged(String value) {
    locationName = value;

  }

  @action
  onRadioSelected(AlertRadio? selectedValue) {
    if (selectedValue != null) {
      debugPrint(selectedValue.toString());
      selected = selectedValue;
    }
  }

  @action
  onRetry(AlertAction? action) {}


  _AddSafeAreaPageViewModel(){
    mainVM.getCurrentLocation();

  }





  @action
  setupCircle(LatLong coordinate){
    Set<Circle> getCircles = {};
    _circle = Circle(circleId: CircleId("${coordinate.hashCode}"),
     center:  LatLng(coordinate.lat, coordinate.lng),
     radius: radius,
     fillColor:Colors.green.withOpacity(0.1),
     strokeWidth: 2,
     strokeColor: Colors.black45
    );
    getCircles.add(_circle!);
    circles = getCircles;
  }

  @action
  setupMarker(LatLong coordinate) async{
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/bike.png",
    );
    Set<Marker> getMarkers = {};
    _marker = Marker(
      anchor: const Offset(0.5, 0.5),
      markerId: MarkerId("${coordinate.hashCode}"),
      position: LatLng(coordinate.lat, coordinate.lng),
      consumeTapEvents: false,
      draggable: true,
      onTap: onNext,
      icon:  BitmapDescriptor.defaultMarker,
    );
    if(_marker != null){
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



  @action
  getLocationName(LatLong coordinate) async {
   double Longitude = coordinate.lng;
   double Latitude  =  coordinate.lat;
   isLoader = true;
   var response = await add_safe_area_use_case.fetchAddress(Longitude, Latitude);
   if(response is Success){
    var data = response.data;
    isLoader = false;
    switch (data != null && data.status) {
      case true:
        if(data != null){

          locationAddress = data.locationDetails;
        }
    }
   }
  }

  @action
  setRadius(double r){
    radius=r;
  }


  @action
  addNow() async{
    uploadingLoader = true;
    var response = await add_safe_area_use_case.uploadLocationDetails(
       // _prefs!.userId,
      // data!.kidId,

        userId,
       kidId,
        locationName,
        locationAddress!.name,
        alertSelected,
        radius);
    if (response is Success) {
      var data = response.data;
      uploadingLoader = false;
      switch (data != null && data.status) {
        case true:
          if(data!.isSaved){
            MyUtils.toastMessage("Submitted Details");
           _navigator.popAndNavigateTo(Routes.dashboard);
          }else{
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
    }else if(response is Error){
      uploadingLoader = false;
    }
  }





}

