import 'package:eagle_netra/core/common/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';



import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/current_date_time.dart';
import '../../core/common/lat_long.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/position.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/repository/kids_track_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';
import 'main_view_model.dart';


part 'kids_track_page_view_model.g.dart';

class KidsTrackPageViewModel = _KidsTrackPageViewModel with _$KidsTrackPageViewModel;

abstract class _KidsTrackPageViewModel with Store {
  final mainVM = instance<MainViewModel>();
  final _navigator = instance<NavigationService>();
  final _appSettings = instance<AppSettings>();
  final kids_track_use_case = instance<KidsTrackRepository>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();

  ShortDetail? data;

  bool _isVisible = true;

  @observable
  List<String> process = [];

  @observable
  Set<Marker> markers = {};

  List<Marker> _backupMakers = [];


  @observable
  bool datesSelectedListLoader = false;

  @observable
  String date = "";

  @observable
  String time = "";

  @observable
  String startTime = "";

  TimeOfDay sTimeDisplay = TimeOfDay.now();
  TimeOfDay eTimeDisplay = TimeOfDay.now();

  @observable
  String endTime = "";


  @observable
  String image = "";

  @observable
  bool enableBtn = false;


  @action
  currentDate() {
    date = GetDateState.getCurrentDate();
  }

  @action
  rangeStart(BuildContext context, TimeOfDay timeOfDay) {
    sTimeDisplay = timeOfDay;
    startTime = GetDateState.getStartTimeRange(context, timeOfDay);
    debugPrint("startTime $startTime");
    validateBtn();

  }


  @action
  rangeEnd(BuildContext context, TimeOfDay timeOfDay) {
    eTimeDisplay = timeOfDay;
    endTime = GetDateState.getStartTimeRange(context, timeOfDay);
    debugPrint("endTime $endTime");
    validateBtn();
  }


  openDatePicker() {
    dialogManager.openDatePicker();
  }

  _KidsTrackPageViewModel(this.data) {
    mainVM.getCurrentLocation();

    //onSelectDate;
  }

  @observable
  bool isVisible = false;


  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      date = "${selected.year}-${selected.month}-${selected.day}";
      debugPrint('daTE: $date');
    } else {
      currentDate();
    }
    validateBtn();
  }


  @action
  onSelectStartTime(TimeOfDay selectedstarttime) {
    startTime = "${selectedstarttime.hour}:${selectedstarttime.minute}";
    debugPrint("startTime $startTime");

  }

  @action
  onSelectEndTime(TimeOfDay selectedendtime) {
    endTime = "${selectedendtime.hour}:${selectedendtime.minute}";

  }


  @action
  initialData() async {
    var smartCardId = data!.smartCardId;
    isVisible = true;
    var response = await kids_track_use_case.fetchPositions(
        smartCardId, date, startTime, endTime);
    if (response is Success) {
      var data = response.data;
      isVisible = false;
      var tmp = <String>[];
      switch (data != null && data.status) {
        case true:
          _backupMakers.clear();
          for (var element in data!.latlongData) {
            await setupMarker(element.latLong, element.posId, date);
            tmp.add("${element.postionalTime.hour}:${element.postionalTime.minute}");
          }
          markers = _backupMakers.toSet();
          process = tmp.reversed.toList();
          break;
      }
    }
  }


  @action
  setupMarker(LatLong coordinate, String posId, String positionalTime) async {
    var marker = Marker(
      markerId: MarkerId("${coordinate.hashCode}"),
      position: LatLng(coordinate.lat, coordinate.lng),
      consumeTapEvents: true,
      draggable: false,
      icon: BitmapDescriptor.defaultMarker,
    );
    _backupMakers.add(marker);

  }


  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {

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
 validateBtn() async{
    if(date.isNotEmpty && startTime.isNotEmpty && endTime.isNotEmpty){
      enableBtn = true;

    }else{
      enableBtn = false;
    }
 }


  Future<bool> backToPrevious() async{
   _navigator.navigatorKey.currentState!.popUntil((route) => route.isFirst );
    return false;
  }
  // backToPrevious(){
  //   // _navigator.popAndNavigateTo(Routes.kidsHistory);
  //   _navigator.pop();
  // }



}