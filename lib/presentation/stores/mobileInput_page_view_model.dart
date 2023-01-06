import 'dart:html';

import 'package:eagle_netra/core/common/alert_action.dart';
import 'package:eagle_netra/core/common/alert_data.dart';
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

  String selectedCodeId = "";

  @observable
  bool enableBtn = false;


  @observable
  String showSnackbarMsg = "";

  _MobileInputViewModel(){
    onNext();
    validateInput();
  }

  @action
  onNumberClear() {
    mobileNumber = "";
  }


  @action
  onNumberChange(String number) {
    mobileNumber = number;
  }


  @action
  resendOtp() async{
    reSendingOtpLoader = true;
    var number = mobileNumber.trim();
    var response = await _mobinputrepo.sendOtp(number);
    if(response is Success){
      var data = response.data;
      reSendingOtpLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.status) {
            showSnackbarMsg = data.message;
          }
      }
    }
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
          isShow = data!.isSend;
      }
    }
  }



  @action
  verifyOtp() async{
    verifyLoader = true;
    var number = mobileNumber.trim();
    var otp = onOtp;
    var response = await _mobinputrepo.verifyOtp(number, otp);
    if(response is Success){
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if(data!.isVerified){
            _appSettings.saveUserId(data.userId);
            // _navigator.navigateTo(routeName);
          }
      }
    }

  }

  bool _isValid = false;

  @action
  otpEntered(String enteredOtp) {
    onOtp = enteredOtp;
    if (_isValid) {
      _navigator.navigateTo(Routes.splash );
     // enableBtn = true;
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


  @action
  String? validateOtp(String? otp) {
    if (otp != null) {
      var regEp = RegExp(r"[0-9]{4}");
      enableBtn = regEp.hasMatch(otp);
    }
    return null;
  }

}