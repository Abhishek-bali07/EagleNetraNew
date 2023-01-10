import 'dart:io';

import 'package:eagle_netra/presentation/stores/registration_page_view_model.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/constants.dart';
import '../../core/common/track_radio_button.dart';
import '../../core/helpers/image_assets.dart';
import '../../utils/dialog_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController textEditingController;
  late final DialogController dialogController;
  late final RegistrationViewModel _vm;



  @override
  void initState() {
    _vm = RegistrationViewModel();
    textEditingController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 2, child: _upperSideContent()),
            Expanded(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            expand(flex: 7, child: Image.asset(ImageAssets.logo)),
            expand(flex: 3, child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Complete your Registration",
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold,color: AppColors.Gray),
                ),
                Text(
                  "Fill the form below to complete your registration",
                  style: TextStyle(fontSize: 16.sp,color: AppColors.Gray ),
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _lowerSideContent(){
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
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      decoration:
                      BoxDecoration(color: Theme.of(context).colorScheme.surface),
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 50, left: 24, right: 24),
                            child: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    _vm.onNameChanged(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: Constants.enterYourName,
                                    prefixIcon: Icon(Icons.person),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.SilverChalice),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                          Theme.of(context).colorScheme.primary),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.SilverChalice),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    _vm.onEmailChanged(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: Constants.enterYourEmail,
                                    prefixIcon: Icon(Icons.email),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.SilverChalice),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                          Theme.of(context).colorScheme.primary),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.SilverChalice),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                               Row(
                                  children: [
                                    Text("Tracking for"),
                                    Observer(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                value: TrackRadio.kids,
                                                groupValue: _vm.selected,
                                                onChanged: _vm.onRadioSelected,
                                                activeColor: Colors.black,
                                              ),
                                              const Text(
                                                "Kids",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    Observer(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                value: TrackRadio.employee,
                                                groupValue: _vm.selected,
                                                onChanged: _vm.onRadioSelected,
                                                activeColor: Colors.black,
                                              ),
                                              const Text("Employee",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.black))
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: double.maxFinite,
                                height: 60,
                                child: Observer(
                                    builder: (_) => ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                        disabledForegroundColor:
                                        AppColors.Black.withOpacity(0.38),
                                        disabledBackgroundColor:
                                        AppColors.Black.withOpacity(
                                            0.12), // Disable color
                                      ),
                                      onPressed: _vm.valid == true &&
                                          !(_vm.submitting == true)
                                          ? () {
                                        _vm.onSubmit();
                                      }
                                          : null,
                                      child: !(_vm.submitting == true)
                                          ? Text(
                                        Constants.done,
                                        style: TextStyle(
                                            color: AppColors.Black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                          : CircularProgressIndicator(),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: (){

                            },
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
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
                                            //vm.pickFile();
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                            Theme.of(context).colorScheme.surface,
                                            radius: 18,
                                            child: CircleAvatar(
                                              backgroundColor:
                                              Theme.of(context).colorScheme.primary,
                                              radius: 16,
                                              child: const Icon(Icons.edit),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _lowerSideContent(){
  //   return  Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Column(
  //           children: [
  //
  //
  //             TextField(
  //               keyboardType: TextInputType.name,
  //               onChanged: (value) {
  //                 _vm.onNameChanged(value);
  //               },
  //               decoration: InputDecoration(
  //                 hintText: Constants.enterYourName,
  //                 prefixIcon: Icon(Icons.person),
  //                 enabledBorder: UnderlineInputBorder(
  //                   borderSide:
  //                   BorderSide(color: AppColors.SilverChalice),
  //                 ),
  //                 focusedBorder: UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color:
  //                       Theme.of(context).colorScheme.primary),
  //                 ),
  //                 border: UnderlineInputBorder(
  //                   borderSide:
  //                   BorderSide(color: AppColors.SilverChalice),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 32,
  //             ),
  //             TextField(
  //               keyboardType: TextInputType.emailAddress,
  //               onChanged: (value) {
  //                 _vm.onEmailChanged(value);
  //               },
  //               decoration: InputDecoration(
  //                 hintText: Constants.enterYourEmail,
  //                 prefixIcon: Icon(Icons.email),
  //                 enabledBorder: UnderlineInputBorder(
  //                   borderSide:
  //                   BorderSide(color: AppColors.SilverChalice),
  //                 ),
  //                 focusedBorder: UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color:
  //                       Theme.of(context).colorScheme.primary),
  //                 ),
  //                 border: UnderlineInputBorder(
  //                   borderSide:
  //                   BorderSide(color: AppColors.SilverChalice),
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 0.01.sw),
  //                   child: const Text("Track For: "),
  //                 ),
  //                 Row(
  //                   children: [
  //                     Observer(
  //                       builder: (BuildContext context) {
  //                         return Expanded(
  //                           flex: 1,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               Radio(
  //                                 value: TrackRadio.kids,
  //                                 groupValue: _vm.selected,
  //                                 onChanged: _vm.onRadioSelected,
  //                                 activeColor: Colors.black,
  //                               ),
  //                               const Text(
  //                                 "Kids",
  //                                 style: TextStyle(
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 18,
  //                                     color: Colors.black),
  //                               )
  //                             ],
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                     Observer(
  //                       builder: (BuildContext context) {
  //                         return Expanded(
  //                           flex: 1,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               Radio(
  //                                 value: TrackRadio.employee,
  //                                 groupValue: _vm.selected,
  //                                 onChanged: _vm.onRadioSelected,
  //                                 activeColor: Colors.black,
  //                               ),
  //                               const Text("Employee",
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.w500,
  //                                       fontSize: 18,
  //                                       color: Colors.black))
  //                             ],
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             )
  //
  //
  //
  //
  //           ],
  //         ),
  //   );
  //
  //
  // }


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

