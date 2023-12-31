import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../utils/dialog_controller.dart';
import '../stores/kids_page_view_model.dart';
import '../ui/theme.dart';

class KidsPage extends StatefulWidget {
  const KidsPage({Key? key}) : super(key: key);

  @override
  State<KidsPage> createState() => _KidsPageState();
}

class _KidsPageState extends State<KidsPage> {
  late final KidsPageViewModel _viewModel;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;


  @override
  void initState() {
    _viewModel = KidsPageViewModel();

    super.initState();
    _disposers = [
      reaction((p0) => _viewModel.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_viewModel.dialogManager.errorData!, p0,
              positive: _viewModel.onError,
              close: _viewModel.dialogManager.closeErrorDialog);
        }
      }),
    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {
            _viewModel.backToPrevious();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("MyKids"),
      ),

      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(flex: 10, child: _lowerSideContent())],
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Observer(builder: (BuildContext context) {
              if (_viewModel.isLoading) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 0.08.sh,
                      width: 0.10.sh,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.02.sw, horizontal: 0.05.sw),
                          child: const CircularProgressIndicator())),
                );
              } else {
                return _viewModel.kidHistory.isEmpty
                    ? Center(
                  child: Text("Does not have anyone"),
                )
                    : ListView.separated(
                    itemBuilder: (context, index) => listItem(index),
                    separatorBuilder: (BuildContext context, int index) =>
                        separatedBox(),
                    itemCount: _viewModel.kidHistory.length);
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget listItem(int index) {
    return GestureDetector(
      onTap: (){
        _viewModel.onSafeareaSection(_viewModel.kidHistory[index]);
      },
      child: Container(
        width: 0.90.sw,
        padding: EdgeInsets.symmetric(
          vertical: 0.02.sw,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x1a000000),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: Offset(0, 10))
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.01.sw, horizontal: 0.03.sw),
          child: Column(
            children: [
              Observer(
                builder: (BuildContext context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Observer(
                              builder: (BuildContext context) {
                                return _viewModel.kidHistory[index].image.isNotEmpty
                                    ? CircleAvatar(
                                  radius: 0.08.sw,
                                  backgroundColor: AppColors.lightGray,
                                  foregroundImage:
                                  NetworkImage(_viewModel.kidHistory[index].image),
                                )
                                    : CircleAvatar(
                                  radius: 0.08.sw,
                                  // backgroundColor:
                                  //     AppColors.drawerPrimary,
                                  child: SvgPicture.asset("assets/images/boy.svg"),


                                );
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 8.0),
                                child: _viewModel.kidHistory[index].name
                                    .text(AppTextStyle.userNameStyle),
                              ),
                              SizedBox(height: 0.01.sw),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 8.0),
                                    child: Text(
                                        "Class:${_viewModel.kidHistory[index].clsName}"),
                                  ),
                                   SizedBox(width: 0.01.sw),
                                  const SizedBox(
                                    height: 15,
                                    child: VerticalDivider(
                                      width: 5,
                                      thickness: 2,
                                      indent: 2,
                                      endIndent: 0,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 8.0),
                                    child: Text("Age:${_viewModel.kidHistory[index].age}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: SvgPicture.asset(ImageAssets.home),
                          ),
                        ],
                      ),
                      Container(
                        decoration:
                            const BoxDecoration(color: AppColors.lightGray),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text("ID Active form :${_viewModel.onSelectedDate(_viewModel.kidHistory[index].activateFrom)}",
                                    style: TextStyle(fontSize: 12)),
                                Text("ID Expire on : ${_viewModel.onSelectedDate(_viewModel.kidHistory[index].expireDate)}",
                                    style: TextStyle(fontSize: 12)),
                              ]),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.03.sw,
    );
  }

  // Widget _lowerSideContent() {
  //   return Column(
  //     children: [
  //       Expanded(
  //         flex:2,
  //         child: Observer(
  //           builder: (BuildContext context) {
  //             return Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Observer(
  //                         builder: (BuildContext context) {
  //                           return _viewModel.image.isNotEmpty
  //                               ? CircleAvatar(
  //                                   radius: 0.08.sw,
  //                                   backgroundColor: AppColors.lightGray,
  //                                   foregroundImage:
  //                                       NetworkImage(_viewModel.image),
  //                                 )
  //                               : CircleAvatar(
  //                                   radius: 0.08.sw,
  //                                   backgroundColor: AppColors.drawerPrimary,
  //                                 );
  //                         },
  //                       ),
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.only(top: 8.0, left: 8.0),
  //                           child: _viewModel.kidName.text(AppTextStyle.userNameStyle),
  //                         ),
  //                         SizedBox(height: 0.01.sw),
  //                         Padding(
  //                           padding: const EdgeInsets.only(top: 5.0, left: 8.0),
  //                           child: Text("Class VI"),
  //                         ),
  //                       ],
  //                     ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 150.0),
  //                     child: SvgPicture.asset(
  //                         ImageAssets.home
  //                       ),
  //                   ),
  //
  //                   ],
  //                 ),
  //
  //                Container(
  //                     decoration:const BoxDecoration(
  //                       color: Colors.grey
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: [
  //                           Text("ID Active form : 1st Jan 2022", style: TextStyle(fontSize: 12)),
  //
  //                            Text("ID Expiree on : 1st Jan 2022", style: TextStyle(fontSize: 12)),
  //                         ]
  //                         ),
  //                     ),
  //                   ),
  //
  //
  //
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //       SizedBox(height: 0.02.sw),
  //       Divider()
  //     ],
  //   );
  // }
}
