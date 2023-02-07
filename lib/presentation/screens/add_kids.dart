import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import '../../core/common/constants.dart';
import '../../core/common/wrapper.dart';
import '../../core/helpers/image_assets.dart';
import '../../core/helpers/widgets.dart';
import '../../utils/dialog_controller.dart';
import '../../utils/extensions.dart';
import '../stores/add_kids_view_model.dart';
import '../stores/my_kids_view_model.dart';
import '../ui/theme.dart';

class AddKidScreen extends StatefulWidget {
  const AddKidScreen({Key? key}) : super(key: key);

  @override
  State<AddKidScreen> createState() => _AddKidScreenState();
}

class _AddKidScreenState extends State<AddKidScreen> {
  late final TextEditingController textEditingController;
  late final DialogController dialogController;
  late final AddKidViewModel _vm;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _vm = AddKidViewModel();
    textEditingController = TextEditingController();
    super.initState();
    _disposers = [
      reaction((_) => _vm.showPickSourceDialog, (value) {
        if (value is DialogTrigger && value != null) {
          showMyDialog(value, context,
              (BuildContext context) => ImageSourceDialog(context),
              barrierDismissible: true);
        }
      }),
      reaction((_) => _vm.snackbarMessage, //to observe
          (value) {
        var v = value as Wrapper<String>;
        if (v.core != "") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(v.core),
            duration: Duration(seconds: 2),
          ));
        }
      }),
      
      reaction((p0) => _vm.userMobileNumber, (p0) {

      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add Kid"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 3, child: _upperSideContent()),
            Expanded(flex: 8, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Text(
              "Add a Smart Id Card",
              style: TextStyle(fontSize: 25.sp),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        Observer(builder: (_) => getImage()),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {
                                  _vm.pickFile();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surface,
                                  radius: 18,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.Black,
                                    radius: 16,
                                    child: const Icon(Icons.edit),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _lowerSideContent() {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.surface),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface),
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 24, right: 24),
                              child: Column(
                                children: [

                                  TextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      _vm.onNameChanged(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: Constants.kidname,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.SilverChalice),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      _vm.onCardNumberChanged(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: Constants.cardnumber,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.SilverChalice),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _vm.onDeviceChanged(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: Constants.deviceId,
                                      suffixIcon: Icon(Icons.qr_code),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.SilverChalice),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: TextField(
                                          keyboardType: TextInputType.name,
                                          onChanged: (value) {
                                              _vm.onClassValueChanged(value);
                                          },

                                          decoration: InputDecoration(
                                            hintText: Constants.classname,

                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.Black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.Black,
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.SilverChalice),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.0,),

                                      Flexible(
                                        child: TextField(
                                          keyboardType: TextInputType.name,
                                          onChanged: (value) {
                                                _vm.onAgeChanged(value);
                                          },
                                          decoration: InputDecoration(

                                            hintText: Constants.age,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.Black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.Black,
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.SilverChalice),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                      child: Text("Emergency Contact", style: TextStyle(fontSize: 20.sp),)
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Observer(
                                  builder: (BuildContext context) {
                                    return TextField(
                                      key: ObjectKey(_vm.gettingLoader),
                                      keyboardType: TextInputType.name,
                                      controller: TextEditingController(text: _vm.userMobileNumber),
                                      onChanged: _vm.mobileNumber,
                                      decoration: InputDecoration(
                                        hintText: Constants.mobilenumber,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.Black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.Black,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.SilverChalice),
                                        ),
                                      ),
                                    );
                                  },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      _vm.onMobileChanged(value);

                                    },
                                    decoration: InputDecoration(
                                      hintText: Constants.mobilenumber,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.SilverChalice),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _vm.onChangedNumber(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: Constants.mobilenumber,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.Black,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.SilverChalice),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),


                                  

                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 14, right: 14),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:  Container(
                        width: double.maxFinite,
                        height: 60,
                        child: Observer(
                            builder: (_) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimary,
                                backgroundColor: AppColors.Black,
                                disabledForegroundColor:
                                AppColors.drawerPrimary,
                                disabledBackgroundColor: AppColors
                                    .drawerPrimary, // Disable color
                              ),
                              onPressed: _vm.valid == true &&
                                  !(_vm.submitting == true)
                                  ? () {
                                _vm.onSubmit();
                              }
                                  : null,
                              child: !(_vm.submitting == true)
                                  ? const Text(
                                Constants.addbtn,
                                style: TextStyle(
                                    color: AppColors.White,
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              )
                                  : CircularProgressIndicator(color: Colors.white),
                            )),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImage() {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      radius: 140,
      child: CircleAvatar(
        backgroundImage: _vm.file == null
            ? const AssetImage(ImageAssets.UserImage)
            : getFileImage(_vm.file),
        backgroundColor: AppColors.SilverChalice,
        radius: 60,
      ),
    );
  }

  ImageProvider getFileImage(File? file) {
    return FileImage(file!);
  }
}
