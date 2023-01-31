import 'dart:io';

import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/fetch_adress_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/repository/dashboard_page_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
import 'main_view_model.dart';


part 'dashboard_page_view_model.g.dart';

class DashBoardPageViewModel = _DashBoardPageViewModel with _$DashBoardPageViewModel;

abstract class _DashBoardPageViewModel with Store{
  final mainVM = instance<MainViewModel>();
  final _prefs = instance<AppSettings>();
  final messageInformer = MessageInformer();
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();
  final dashboard_page_use_case = instance<DashboardPageRepository>();

  Marker? _marker;


  @observable
  bool isShow = false;

  @observable
  bool isLoader = false;

  @observable
  bool isCalling = false;

  @observable
  ObservableSet<Marker> markers = ObservableSet.of({});

  @observable
  bool isVisible = false;

  @observable
  String kidName = "";

  @observable
  String currentDate = "";


  @observable
  String callingNumber = "";


  @observable
  String currentTime = "";

  @observable
  String battery = "";

  @observable
  String deviceCondition = "";


  @observable
  String image = "";


  @observable
  File? selectedImage;


  @observable
  String locationAddress = "";

  _DashBoardPageViewModel(){
    initialData();
  }

  @action
  setupMarker(LatLong coordinate, String posId) async {
    // BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
    //   const ImageConfiguration(),
    //   "assets/images/boy.svg",
    // );
    var marker = Marker(
      markerId: MarkerId("${coordinate.hashCode}"),
      position: LatLng(coordinate.lat, coordinate.lng),
      consumeTapEvents: true,
      draggable: false,
      icon:BitmapDescriptor.defaultMarker,
      onTap:(){
        onNext(posId);
      }
    );
    markers.add(marker);

  }


  initialData() async {
  var userId = "";
  isVisible  = true;
  var response = await dashboard_page_use_case.fetchPosition(userId);
  if(response is Success){
      var data = response.data;
      isVisible = false;
      switch(data != null && data.status){
      case true:
        if(data != null){
        // markerPosition = data.latlongData;
          for (var element in data.latlongData) {
           await setupMarker(element.latLong,element.posId);
          }
      }
    }
  }
}


  @action
  openBottomSheet() async{
    isShow = !isShow;
  }

  @action
  onNext(String posId) async {
    // api call
    // response get
    // open bottom sheet
  var userId = "";
  isLoader = true;
  var response = await dashboard_page_use_case.deviceData(posId,userId);
  if(response is Success){
    var data = response.data;
    isLoader = false;
    switch(data != null && data.status){
      case true:
        kidName = data!.name;
        currentDate = data.devicedate;
        currentTime = data.devicetime;
        image = data.image;
        battery = data.batteryperformance;
        deviceCondition = data.condition;
        locationAddress = data.devicelocation;
        callingNumber = data.phone;
        openBottomSheet();

        break;
      default:
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



  @action
  onRetry(AlertAction? action) {}
}