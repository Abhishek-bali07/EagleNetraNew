import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/constants.dart';
import '../../utils/dialog_controller.dart';
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
  _vm = AccessManagementViewModel();
    super.initState();
    _disposers = [


    ];
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
        onPressed: () {},
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
                                    top: 50, left: 24, right: 24),
                                child: Column(
                                  children: [

                                    TextField(
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                       // _vm.onNameChanged(value);
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
                                       // _vm.onCardNumberChanged(value);
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
                                        //_vm.onDeviceChanged(value);
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
                                  //  _vm.onSubmit();
                                }
                                    : null,
                                child: !(_vm.submitting == true)
                                    ? Text(
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

        ),);
  }

}
