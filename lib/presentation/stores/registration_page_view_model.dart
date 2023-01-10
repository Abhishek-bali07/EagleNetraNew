import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/common/track_radio_button.dart';
import '../../core/helpers/navigation_service.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';

part 'registration_page_view_model.g.dart';

class RegistrationViewModel = _RegistrationViewModel  with _$RegistrationViewModel;



abstract class _RegistrationViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();



  @observable
  bool valid = false;

  @observable
  bool submitting = false;

  var _name = "";

  var _email = "";

  @observable
  File? file;


  @action
  onNameChanged(String value) {
    _name = value;

  }

  @action
  onEmailChanged(String value) {
    _email = value;

  }


  @action
  onSubmit() {

  }


  @observable
  String selectedGender = "";

  @observable
  TrackRadio selected = TrackRadio.none;


  @action
  onRadioSelected(TrackRadio? selectedValue) {
    if (selectedValue != null) {
      debugPrint(selectedValue.toString());
      selected = selectedValue;


    }
  }
}