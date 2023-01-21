import 'dart:ui';

import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/service.dart';
import '../../core/helpers/navigation_service.dart';
import '../../utils/dialog_manager.dart';
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

  @observable
  bool isShow = false;

  Marker? _marker;

  @observable
  Set<Marker> markers = {};

  Circle? _circle;

  @observable
  Set<Circle> circles = {};


  _AddSafeAreaPageViewModel(){
    mainVM.getCurrentLocation();
  }





  @action
  setupCircle(LatLong coordinate){
    Set<Circle> getCircles = {};
    _circle = Circle(circleId: CircleId("${coordinate.hashCode}"),
     center:  LatLng(coordinate.lat, coordinate.lng),
     radius: 500,
     fillColor:Colors.green.withOpacity(0.1),
     strokeWidth: 2,
     strokeColor: Colors.black45
    );
    getCircles.add(_circle!);
    circles = getCircles;
  }

  @action
  setupMarker(LatLong coordinate){
    Set<Marker> getMarkers = {};
    _marker = Marker(
      anchor: const Offset(0.5, 0.5),
      markerId: MarkerId("${coordinate.hashCode}"),
      position: LatLng(coordinate.lat, coordinate.lng),
      consumeTapEvents: false,
      draggable: true,
      // infoWindow: InfoWindow(
      //   title: "Rehana School",
      //    snippet: 'Lat: ${coordinate.lat} Lng: ${coordinate.lng}' ,
      // ),
      onTap: (){
        onNext();
      },
      icon:  BitmapDescriptor.defaultMarker,
    );
    getMarkers.add(_marker!);
    markers = getMarkers;
    setupCircle(coordinate);
  }



  //
  // Set<Marker> getmarkers() {
  //   setState(() {
  //     markers.add(Marker(
  //       markerId: MarkerId(showLocation.toString()),
  //       position: showLocation,
  //       infoWindow: InfoWindow(
  //         title: 'Marker Title First ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  //   return markers;
  // }



  @action
  onNext() async {
    isShow = false;

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

  onRetry(AlertAction? action) {

  }


}