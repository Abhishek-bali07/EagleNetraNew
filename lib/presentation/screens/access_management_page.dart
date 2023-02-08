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
import '../stores/access_management_view_model.dart';
import '../ui/theme.dart';


class AccessManagementPage extends StatefulWidget {
  const AccessManagementPage({Key? key}) : super(key: key);

  @override
  State<AccessManagementPage> createState() => _AccessManagementPageState();
}

class _AccessManagementPageState extends State<AccessManagementPage> {
  late final TextEditingController textEditingController;
  late final DialogController dialogController;
  late final AccessManagementViewModel _vm;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    textEditingController = TextEditingController();
    _vm = AccessManagementViewModel();
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

    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    drawerEnableOpenDragGesture: false,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: AppColors.appBlack,
      leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back),
      ),
      title: Text("Access Management"),
    ),
    body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Expanded(flex: 8, child: _lowerSideContent())
        ],
      ),
    ),
  );
}





  Widget  _lowerSideContent() {
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
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface),
                        child: SingleChildScrollView(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24),
                                child: Column(
                                  children: [

                                    Container(
                                      width: 140,
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.blue, shape: BoxShape.circle),
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
                                    ),

                                    SizedBox(height: 0.03.sw),

                                    TextField(
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                       _vm.onNameChanged(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: Constants.gurdianname,
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
                                       _vm.onNumberChanged(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: Constants.gurdiannumber,
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
                                        _vm.onRelationChanged(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: Constants.relationship,

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
                            builder: (BuildContext context) {
                              return  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                  backgroundColor:  AppColors.drawerPrimary,
                                  disabledForegroundColor:
                                  AppColors.drawerPrimary,
                                  disabledBackgroundColor: AppColors.Black, // Disable color
                                ),
                                onPressed: _vm.valid == true && !(_vm.submitting == true)
                                    ? _vm.onSubmit
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
                              );
                            },



                          ),
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
            ?  AssetImage(ImageAssets.UserImage)
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
