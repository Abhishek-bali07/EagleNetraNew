import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/message_informer.dart';
import '../../core/helpers/navigation_service.dart';
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




  @action
  setupMarker(LatLong coordinate){
    Set<Marker> getMarkers = {};
    _marker = Marker();
    getMarkers.add(_marker);
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
}