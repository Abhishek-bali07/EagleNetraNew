import 'package:eagle_netra/core/common/alert_action.dart';
import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/mobile_number_code.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/core/repository/mobile_input_repository.dart';
import 'package:eagle_netra/presentation/app_navigator/di.dart';
import 'package:eagle_netra/presentation/screens/mobileInput_page.dart';
import 'package:eagle_netra/utils/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'mobileInput_page_view_model.g.dart';

class MobileInputViewModel = _MobileInputViewModel with _$MobileInputViewModel;

abstract class _MobileInputViewModel  with Store {
  final _navigator = instance<NavigationService>();
  final  _mobinputrepo = instance<MobileInputRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();


  @observable
  bool gettingDataLoader = false;

  @observable
  bool sendingLoader = false;



  @observable
  String mobileNumber = "";

  String selectedCodeId = "";

  @observable
  bool enableBtn = false;

  _MobileInputViewModel(){
    validateInput();
  }




  // @action
  // getNumberCodes() async {
  //   gettingDataLoader = true;
  //   var response = await _mobinputrepo.getCountryCodes();
  //   if(response is Success){
  //     var data = response.data;
  //     gettingDataLoader = false;
  //     switch(data != null && data.status){
  //       case true:
  //         codes = data!.codes;
  //         selectedCodeId = data.codes.first.id;
  //         break;
  //       default:
  //     }
  //   }
  // }


  @action
  onNumberClear() {
    mobileNumber = "";
  }

  // onCodeSelected(MobileNumberCode? code) {
  //   selectedCodeId = code!.id;
  // }

  @action
  onNumberChange(String number) {
    mobileNumber = number;
  }

  @action
  onNext() async {
    sendingLoader = true;
    var number = mobileNumber.trim();
    var response = await _mobinputrepo.sendOtp(number);
    if (response is Success) {
      var data = response.data;
      sendingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isSend) {
          dialogManager.initData(AlertData(
              StringProvider.otpText,
              null,
              StringProvider.appId,
              StringProvider.done,
              null,
              null,
              null,
              data));

          }
      }
    }
  }


  onRetry(AlertAction? action) {
    onNext();
  }


  @action
  validateInput() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mobileNumber.length == 12) {
        enableBtn = true;
      } else {
        enableBtn = false;
      }
    }
  }
}