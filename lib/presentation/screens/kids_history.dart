import 'package:eagle_netra/core/common/dialog_state.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../../core/helpers/image_assets.dart';
import '../../utils/dialog_controller.dart';
import '../stores/kids_history_view_model.dart';
import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class KidsHistory extends StatefulWidget {
  const KidsHistory({Key? key}) : super(key: key);

  @override
  State<KidsHistory> createState() => _KidsHistoryState();
}

class _KidsHistoryState extends State<KidsHistory> {
  late final KidsHistoryViewModel _viewModel;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;



  @override
  void initState() {
    _viewModel = KidsHistoryViewModel();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Kid(s) History"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SilverChalice,
        foregroundColor: AppColors.Black,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body:SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 10, child: _lowerSideContent())],
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
            child: Observer(builder: (BuildContext context) {
              if (_viewModel.isLoading) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 0.10.sh,
                      width: 0.10.sh,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.05.sw, horizontal: 0.05.sw),
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




  Widget listItem(int index){
    return GestureDetector(
      onTap:(){
        _viewModel.onNext(_viewModel.kidHistory[index]);
      },
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
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
                          Expanded(
                            flex: 1,
                            child: Padding(
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
                                    // backgroundColor:
                                    //     AppColors.drawerPrimary,
                                    child: SvgPicture.asset("assets/images/boy.svg"),


                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: Column(
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
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, left: 8.0),
                                      child: Text(
                                          _viewModel.kidHistory[index].clsName),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0,),
                                      child: Text("(Age:${_viewModel.kidHistory[index].age})"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
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
}
