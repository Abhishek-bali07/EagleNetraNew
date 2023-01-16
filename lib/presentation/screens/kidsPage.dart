import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/utils/extensions.dart';
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
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("My Kids"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SilverChalice,
        foregroundColor: AppColors.Black,
        onPressed:(){},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(flex: 8, child: _lowerSideContent())],
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Column(
      children: [
        Expanded(
          flex: 10,
            child: Container(
              color: Colors.white,
              child: Observer(
                builder: (BuildContext context) {
                  if(_viewModel.isLoading){
                    return  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 0.10.sh,
                          width: 0.10.sh,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.05.sw,
                                  horizontal: 0.05.sw),
                              child:
                              const CircularProgressIndicator())),
                    );
                  }else{
                    return _viewModel.kidHistory.isEmpty ?
                        Center(
                          child: Text("Does not have anyone"),
                        )
                        : ListView.separated(
                        itemBuilder: (context, index) => listItem(index),
                        separatorBuilder:
                            (BuildContext context, int index) => separatedBox(),
                        itemCount: _viewModel.kidHistory.length
                    );
                  }
                }),
            ),),
      ],
    );
  }

  Widget listItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.02.sw,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Color(0x1a000000),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 10))
          ]),
      child:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
        child:Column(
          children: [
            Expanded(
              flex:2,
              child: Observer(
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
                                return _viewModel.image.isNotEmpty
                                    ? CircleAvatar(
                                  radius: 0.08.sw,
                                  backgroundColor: AppColors.lightGray,
                                  foregroundImage:
                                  NetworkImage(_viewModel.image),
                                )
                                    : CircleAvatar(
                                  radius: 0.08.sw,
                                  backgroundColor: AppColors.drawerPrimary,
                                );
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                                child: _viewModel.kidHistory[index].name
                                    .text(AppTextStyle.userNameStyle),
                              ),
                              SizedBox(height: 0.01.sw),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                                    child: Text(_viewModel.kidHistory[index].clsname),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                                    child: Text(_viewModel.kidHistory[index].clsname),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: SvgPicture.asset(
                                ImageAssets.home
                            ),
                          ),

                        ],
                      ),

                      Container(
                        decoration:const BoxDecoration(
                            color: Colors.grey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("ID Active form : 1st Jan 2022", style: TextStyle(fontSize: 12)),

                                Text("ID Expiree on : 1st Jan 2022", style: TextStyle(fontSize: 12)),
                              ]
                          ),
                        ),
                      ),



                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 0.02.sw),
            Divider()
          ],
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
