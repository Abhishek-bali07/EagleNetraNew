

import 'package:eagle_netra/core/common/alert_action.dart';
import 'package:eagle_netra/core/common/alert_behaviour.dart';
import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/core/common/alert_option.dart';
import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/mobile_number_code.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/core/repository/mobile_input_repository.dart';
import 'package:eagle_netra/presentation/app_navigator/di.dart';
import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/presentation/screens/mobileInput_page.dart';
import 'package:eagle_netra/utils/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/user_status.dart';
import '../screens/verify_otp_page.dart';

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
  bool isShow = false;



  @observable
  bool verifyLoader = false;


  @observable
  bool reSendingOtpLoader = false;



  @observable
  String mobileNumber = "";


  @observable
  String onOtp = "";


  @observable
  bool enableBtn = false;


  @observable
  String showSnackbarMsg = "";


  _MobileInputViewModel(){
    //onNext();
    validateInput();
  }

  @action
  onNumberClear() {
    mobileNumber = "";
  }


  @action
  onNumberChange(String number) {
    mobileNumber = number;
    debugPrint("$mobileNumber");
  }

  @action
  onNext() async {
    isShow = false;
    sendingLoader = true;
    var number = mobileNumber.replaceAll("-", "");
    var response = await _mobinputrepo.sendOtp(number);
    if (response is Success) {
      var data = response.data;
      sendingLoader = false;
      switch (data != null && data.status) {
        case true:
          isShow = data!.isSend;
          break;
      }
    }else if(response is Error){
      sendingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(option: AlertOption.none, action: AlertAction.none)));
    }
  }

  @action
  onUserOtp(String value){
    onOtp = value;
    if(onOtp.length == 4){
      verifyOtp();
    }
  }

  @action
  verifyOtp() async{
    verifyLoader = true;
   var number = mobileNumber.replaceAll("-", "");
    var otp = onOtp;
    var response = await _mobinputrepo.verifyOtp(number, otp);
    if(response is Success){
      var data = response.data;
      verifyLoader = false;
      switch (data != null && data.status) {
        case true:
          if(data!.isVerified){
            _appSettings.saveUserId(data.userId);
            if(data.userStatus == UserStatus.registered.value){
                 _navigator.navigateTo(Routes.dashboard);
               } else{
                     verifyLoader = false;
                     _navigator.navigateTo(Routes.registration);
               }
            //  otpEntered;
          }
          else{
            verifyLoader = false;
            //_navigator.navigateTo(Routes.registration);
          }
          break;
        default:
          verifyLoader = false;
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none, action: AlertAction.none)));
      }
    }else if (response is Error) {
      verifyLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.notmatched,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(option: AlertOption.none, action: AlertAction.none)));
    }
  }




  @action
  reSendOtp() async {
    reSendingOtpLoader = true;
    var number = mobileNumber.replaceAll("-", "");
    var response = await _mobinputrepo.sendOtp(number);
    if(response is Success){
      var data = response.data;
      reSendingOtpLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.status) {
            showSnackbarMsg = data.message;

          }else{

          }
          break;
        default:
      }
    }
  }



  onRetry(AlertAction? action) {
   // onNext();
    verifyOtp();

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