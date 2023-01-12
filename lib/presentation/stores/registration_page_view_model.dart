import 'dart:io';

import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/package.dart';
import '../../core/common/response.dart';
import '../../core/common/track_radio_button.dart';
import '../../core/common/user_status.dart';
import '../../core/common/validator.dart';
import '../../core/common/wrapper.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/repository/userRegister_repository.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/extensions.dart';
import '../app_navigator/di.dart';

part 'registration_page_view_model.g.dart';

class RegistrationViewModel = _RegistrationViewModel  with _$RegistrationViewModel;



abstract class _RegistrationViewModel with Store{
  final _navigator = instance<NavigationService>();
  final Validator _validator = instance<Validator>();
  final _appSettings = instance<AppSettings>();
  final _register_user_use_case = instance<RegisterUserRepository>();
  final dialogManager = DialogManager();
  final ImagePicker _picker = ImagePicker();



  @observable
  bool valid = false;

  @observable
  bool submitting = false;

  var _name = "";

  var _email = "";

  var _mobile = "";

  @observable
  File? file;


  @observable
  String selectedGender = "";

  @observable
  TrackRadio selected = TrackRadio.none;


  @action
  onNameChanged(String value) {
    _name = value;
   validate();
  }

  onInit(String mobile) {
    _mobile = mobile;
  }


  @action
  onEmailChanged(String value) {
    _email = value;
    validate();
  }

  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @observable
  var showPickSourceDialog = DialogTrigger();

  @action
  onSubmit() {
    submitUserDetails();
  }





  @action
  onRadioSelected(TrackRadio? selectedValue) {
    if (selectedValue != null) {
      debugPrint(selectedValue.toString());
      selected = selectedValue;
    }
  }



  submitUserDetails() async{
    // if(file == null){
    //   return;
    // }
    submitting = true;
    var response = await  _register_user_use_case.registerUser(
        _mobile, _name, _email, file!,  selected.value);
    if(response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if(data!.isVerified){
            var userId = response.data!.userId;
            _appSettings.saveUserId(userId ?? "");
            if(data.userStatus == UserStatus.registered.value){
              _navigator.navigatorKey.currentState
                  ?.pushNamedAndRemoveUntil(Routes.dashboard, (Route<dynamic> route) => false);
            }else{
              submitting = false;
              _navigator.navigateTo(Routes.registration);
            }
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


  validate() {
    valid = file != null && isNameValid() &&  isEmailValid();
  }

  isNameValid() {
    return _name.length > 2;
  }

  isEmailValid() {
    return _validator.isValidEmail(_email);
  }





}











