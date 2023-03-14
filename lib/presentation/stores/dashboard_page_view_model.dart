import 'dart:io';

import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';
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
import '../../core/common/user_account_status.dart';
import '../../core/domain/response/fetch_adress_response.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/dashboard_page_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';
import 'main_view_model.dart';

part 'dashboard_page_view_model.g.dart';

class DashBoardPageViewModel = _DashBoardPageViewModel
    with _$DashBoardPageViewModel;

abstract class _DashBoardPageViewModel with Store {
  final mainVM = instance<MainViewModel>();
  final _appSettings = instance<AppSettings>();
  final messageInformer = MessageInformer();
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();
  final dashboard_page_use_case = instance<DashboardPageRepository>();

  // ShortDetails? data;

  @observable
  List<ShortDetail> detailHistory = [];

  Marker? _marker;

  @observable
  bool gettingLoader = false;

  @observable
  String userName = "";

  @observable
  String userEmail = "";

  @observable
  String userImage = "";

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

  @observable
  bool isTap = false;

  _DashBoardPageViewModel() {
    mainVM.getCurrentLocation();
    getDrawerData();
   initialData();
  }


  @action
  setupMarker(LatLong coordinate, String posId) async {
    var marker = Marker(
        markerId: MarkerId("${coordinate.hashCode}"),
        position: LatLng(coordinate.lat, coordinate.lng),
        consumeTapEvents: true,
        draggable: false,
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          onNext(posId);
        });
    markers.add(marker);
  }

  @action
  getDrawerData() async {
    gettingLoader = true;
    var userId = _appSettings.userId;
    var response = await dashboard_page_use_case.fetchUser(userId);
    if (response is Success) {
      var data = response.data;
      gettingLoader = false;
      switch (data != null && data.status) {
        case true:
          userName = data!.shortprofile.name;
          userEmail = data.shortprofile.email;
          userImage = data.shortprofile.profileImage;
          break;
        default:
      }
    } else if (response is Error) {}
  }

  @action
  initialData() async {
    var userId = _appSettings.userId;
    isVisible = true;
    var response = await dashboard_page_use_case.fetchPosition(userId);
    if (response is Success) {
      var data = response.data;
      isVisible = false;
      switch (data != null && data.status) {
        case true:
          if (data != null) {
            // markerPosition = data.latlongData;
            markers.clear();
            detailHistory = data.shortDetails;
            for (var element in data.shortDetails) {
              if (element.latLongDetails != null) {
                await setupMarker(element.latLongDetails!.latLong,
                    element.latLongDetails!.posId);
              }
            }
          }
      }
    } else if (response is Error) {
      MyUtils.toastMessage(response.message ?? "");
    }
  }

  @action
  openBottomSheet() async {
    isShow = !isShow;
  }

  @action
  onNext(String posId) async {
    // api call
    // response get
    // open bottom sheet
    //var userId =_appSettings.userId;
    isLoader = true;
    var response = await dashboard_page_use_case.deviceData(posId);
    if (response is Success) {
      var data = response.data;
      isLoader = false;
      switch (data != null && data.status) {
        case true:
          kidName = data!.data.name;
          currentDate = data.data.devicedate;
          currentTime = data.data.devicetime;
          image = data.data.image;
          battery = data.data.batteryperformance;
          deviceCondition = data.data.condition;
          locationAddress = data.data.devicelocation;
          callingNumber = data.data.phone;
          openBottomSheet();
          break;
        default:
      }
    } else if (response is Error) {
      MyUtils.toastMessage(response.message ?? "");
    }
  }

  CameraPosition initialCameraPosition() {
    if (mainVM.currentLocation != null) {
      return CameraPosition(
        target: LatLng(mainVM.currentLocation?.latitude ?? 0,
            mainVM.currentLocation?.longitude ?? 0),
        zoom: 18,
      );
    } else {
      return Constants.defaultCameraPosition;
    }
  }

  @action
  onRetry(AlertAction? action) {}

   onSafeareaSection(ShortDetail arg){
    _navigator.navigateTo(Routes.safearea, arguments: arg);
  }


  onSubscriptionSection(ShortDetail arg){
    _navigator.navigateTo(Routes.subscription, arguments: arg);
  }

  @action
  onLogout() async {
    _appSettings.setUserId("");
    isTap = true;
    await _navigator.navigateTo(Routes.mobileinput);
    isTap = false;
  }





  // onLogout() {
  //   dialogManager.initData(AlertData(
  //       StringProvider.appName,
  //       null,
  //       StringProvider.appId,
  //       StringProvider.areYouReallyWantToLogout,
  //       StringProvider.Yes,
  //       null,
  //       null,
  //       AlertBehaviour(option: AlertOption.none, action: AlertAction.logout)));
  // }
  //
  // logout(AlertAction? action) {
  //   if (action == AlertAction.logout) {
  //     _appSettings.login(false);
  //     _appSettings.saveUserId("");
  //     _appSettings.setAccountStatus(UserAccountStatus.accountUnknown.status);
  //     _navigator.popAndNavigateTo(Routes.splash);
  //
  //   }
  // }
  //
  // closeLogoutDialog(AlertAction? action) {
  //   if (action == AlertAction.logout) {
  //     dialogManager.closeDialog();
  //   }
  // }
}
