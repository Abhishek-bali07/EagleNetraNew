import 'package:eagle_netra/core/common/track_alert_button.dart';
import 'package:eagle_netra/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/safearea_details_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';


part 'safe_area_details_view_model.g.dart';

class SafeAreaDetailsViewModel = _SafeAreaDetailsViewModel  with _$SafeAreaDetailsViewModel;



abstract class _SafeAreaDetailsViewModel with Store{
  final _appSettings = instance<AppSettings>();
  final _navigator = instance<NavigationService>();
  final dialogManager = DialogManager();
  final add_safe_area_use_case = instance<SafeAreaDetailsRepository>();

  ShortDetails? data;


  @observable
  AlertRadio selected = AlertRadio.none;

  @observable
  String alertSelected = "";

  @observable
  bool uploadingLoader = false;

  @observable
  bool isLoader = false;


  @observable
  String locationAddress = "";

  @observable
  String locationName = "";

  @observable
  String radious = "";

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

  onRetry(AlertAction? action) {}

  locationData() async{
  isLoader = true;
  var response = await add_safe_area_use_case.fetchAdress();
  }

  addNow() async{
    uploadingLoader = true;
    var response = await add_safe_area_use_case.uploadLocationDetails(
        _appSettings.userId,
        data!.kidId,
        locationName,
        locationAddress,
        alertSelected,
        radious);
    if (response is Success) {
      var data = response.data;
      uploadingLoader = false;
      switch (data != null && data.status) {
        case true:
          if(data!.isSaved){
          MyUtils.toastMessage("Submitted Details");
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
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none, action: AlertAction.uploadlocation)));
    }
  }


}