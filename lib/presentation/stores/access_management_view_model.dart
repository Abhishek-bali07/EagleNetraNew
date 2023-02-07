import 'dart:io';

import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/common/constants.dart';
import '../../core/common/response.dart';
import '../../core/common/validator.dart';
import '../../core/common/wrapper.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/repository/access_management_repository.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/extensions.dart';
import '../app_navigator/di.dart';
part 'access_management_view_model.g.dart';

class AccessManagementViewModel = _AccessManagementViewModel  with _$AccessManagementViewModel;



abstract class _AccessManagementViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _appSettings = instance<AppSettings>();
  final Validator _validator = instance<Validator>();
  final add_access_management_use_case = instance<AccessManagementRepository>();
  final dialogManager = DialogManager();
  final ImagePicker _picker = ImagePicker();

  var name = "";

  var mobile = "";

  var relation = "";

  @observable
  bool gettingLoader = false;

  @observable
  bool valid = false;

  @observable
  bool submitting = false;


  @observable
  File? file;



  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @observable
  var showPickSourceDialog = DialogTrigger();



  @action
  onNameChanged(String value) {
    name = value;
    Validate();
  }

  @action
  onNumberChanged(String value) {
    mobile = value;
    Validate();
  }

  @action
  onRelationChanged(String value){
    relation = value;
  }


  @action
  onSubmit(){
     submitAccessDetails();
  }

  @action
  submitAccessDetails() async{
    submitting = true;
    var userId = "1";
    //var userId = _appSettings.userId;
    var response = await add_access_management_use_case.addAccess(
        userId,
        name,
        mobile,
        relation,file!);
    if(response  is Success){
      var data = response.data;
      submitting = false;
      switch(data != null && data.status){
        case true:
          if(data!.isAdded){
            MyUtils.toastMessage("Data Submitted");
            _navigator.pop(
              result:
            );
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
    Validate();
  }

  @action
  Validate() {
    valid = file != null && isNameValid() && isNumberValid();
    debugPrint("valid $valid");
  }

  isNameValid() {
    return name.length > 2;
  }
  isNumberValid(){
    return _validator.isValidNumber(mobile);
  }

}