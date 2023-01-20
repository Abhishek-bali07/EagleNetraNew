import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/constants.dart';
import '../../core/helpers/navigation_service.dart';
import '../app_navigator/di.dart';
import 'main_view_model.dart';



part 'add_safe_area_view_model.g.dart';

class AddSafeAreaPageViewModel = _AddSafeAreaPageViewModel with _$AddSafeAreaPageViewModel;


abstract class _AddSafeAreaPageViewModel with Store{
  final mainVM = instance<MainViewModel>();
  final _navigator = instance<NavigationService>();




  @action
  onSelectLocation(){

  }


  CameraPosition initialCameraPosition() {
    if (mainVM.currentLocation != null) {
      return CameraPosition(
        target: LatLng(mainVM.currentLocation?.latitude ?? 0,
            mainVM.currentLocation?.longitude ?? 0),
        zoom: 14.4746,
      );
    } else {
      return Constants.defaultCameraPosition;
    }
  }


}