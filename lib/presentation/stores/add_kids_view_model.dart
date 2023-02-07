import 'dart:io';


import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/repository/addKids_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/response.dart';
import '../../core/common/validator.dart';
import '../../core/common/wrapper.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/extensions.dart';
import '../../utils/my_utils.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';

part 'add_kids_view_model.g.dart';

class AddKidViewModel = _AddKidViewModel  with _$AddKidViewModel;


abstract class _AddKidViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _appSettings = instance<AppSettings>();
  final Validator _validator = instance<Validator>();
  final add_card_use_case = instance<AddCardRepository>();
  final dialogManager = DialogManager();
  final ImagePicker _picker = ImagePicker();

  var _kidname = "";

  var _cardnumber = "";

  var _device = "";

  var _addclass = "";

  var _addage = "";

  var _addmobile1 = "";

  var _addmobile2 = "";

  var  _addmobile3 = "";


  @observable
  bool gettingLoader = false;

  @observable
  bool valid = false;

  @observable
  bool submitting = false;

  @observable
  String userMobileNumber = "";

  @observable
  File? file;


  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @observable
  var showPickSourceDialog = DialogTrigger();



  @action
  onNameChanged(String value) {
    _kidname = value;
    validate();
  }

  @action
  onCardNumberChanged(String value) {
    _cardnumber = value;
    validate();
  }


  @action
  onDeviceChanged(String value) {
    _device = value;
    //validate();
  }



  @action
  onClassValueChanged(String value) {
    _addclass = value;
    //validate();
  }

  @action
  onAgeChanged(String value) {
    _addage = value;
    validate();
  }


  @action
  onMobileChanged(String value) {
    _addmobile2 = value;
    validate();
  }

  @action
  onChangedNumber(String value) {
    _addmobile3 = value;
    //validate();
  }


  @action
  mobileNumber(String number) {
    userMobileNumber = number;
  }


  @action
  onSubmit() {
    submitKidsDetails();
  }




  @action
  initialData() async{
    gettingLoader = true;
    var userId = _appSettings.userId();
    var response =  await add_card_use_case.getProfileInittialData(userId);
    if(response is Success){
      var data = response.data;
      gettingLoader = false;
      switch(data != null && data.status){
        case true:
          userMobileNumber = data!.mobile;
      }
    }
  }

  submitKidsDetails() async{
    submitting = true;
    var userId = _appSettings.userId;
    var response = await add_card_use_case.addKids(
        userId,
        _kidname,
        _cardnumber,
        _device,
        _addclass,
        _addage,
        userMobileNumber,
        _addmobile2,
        _addmobile3,file!);

    if(response is Success){
      var data = response.data;
      submitting =  false;
      switch(data != null && data.status){
        case true:
          if(data!.isAdded){

            //_navigator.navigateTo(Routes.mykids);
            MyUtils.toastMessage("Data submitted...");
          }else{
            MyUtils.toastMessage("Error");
          }
      }
    }
  }







  @action
  pickFile() {
    onPickFile();
  }

  onPickFile() async {
    var result = await triggerDialog((d) => showPickSourceDialog = d);
    if (result == Constants.camera) {
      final XFile? photo = await _picker.pickImage(
          source: ImageSource.camera, imageQuality: 100);
      debugPrint("choosen photo $photo");
      if (photo != null) {
        file = File(photo.path);
      }
    } else if (result == Constants.gallery) {
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
      debugPrint("choosen photo $photo");
      if (photo != null) {
        file = File(photo.path);
      }
    }
    validate();
  }

  @action
  validate() {
    valid = file != null && isNameValid() &&  isCardValid() && isDeviceValid() && isNumberValid();
  }

  isNameValid() {
    return _kidname.length > 2;
  }

  isCardValid(){
    return  _validator.isValidCard(_cardnumber);
  }

  isDeviceValid(){
    return _device.length>= 5;
    }

  isValidage(){
    return _addage.length <= 3;

  }
  isNumberValid(){
    return _validator.isValidNumber(_addmobile2);
  }
}