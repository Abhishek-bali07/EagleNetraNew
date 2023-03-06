import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../utils/dialog_controller.dart';
import '../stores/management_page_view_model.dart';
import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class ManagementAccessPage extends StatefulWidget {
  const ManagementAccessPage({Key? key}) : super(key: key);

  @override
  State<ManagementAccessPage> createState() => _ManagementAccessPageState();
}

class _ManagementAccessPageState extends State<ManagementAccessPage> {

  late final ManagementViewModel _viewModel;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _viewModel = ManagementViewModel();

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
          title: const Text("Access Management"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.SilverChalice,
          foregroundColor: AppColors.Black,
          onPressed: _viewModel.onAddManagementSection,
          child: Icon(Icons.add),
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



  Widget _lowerSideContent() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Observer(
                builder: (BuildContext context) {
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
                return _viewModel.managementHistory.isEmpty
                    ? Center(
                  child: Text("Empty Records", style: AppTextStyle.introHeadingStyle),
                )
                    : ListView.separated(
                    itemBuilder: (context, index) => listItem(index),
                    separatorBuilder: (BuildContext context, int index) =>
                        separatedBox(),
                    itemCount: _viewModel.managementHistory.length);
              }
            }),
          ),
        ),
      ],
    );
  }



  Widget listItem(int index){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 0.60.sw,
          decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x1a000000),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 10))
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.03.sw,),
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
                                  return  _viewModel.managementHistory[index].image.isNotEmpty
                                      ? CircleAvatar(
                                    radius: 0.08.sw,
                                    backgroundColor: AppColors.lightGray,
                                    foregroundImage:
                                    NetworkImage(_viewModel.managementHistory[index].image),
                                  )
                                      : CircleAvatar(
                                    radius: 0.07.sw,
                                    // backgroundColor:
                                    //     AppColors.drawerPrimary,
                                    child: SvgPicture.asset("assets/images/lady.svg"),


                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 0.01.sw),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _viewModel.managementHistory[index].name
                                    .text(AppTextStyle.headingTextStyle),
                                SizedBox(height: 0.01.sw),
                                _viewModel.managementHistory[index].relationName
                                    .text(AppTextStyle.mandatoryFieldStyle),
                              ],
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
      ),
    );
  }


  Widget separatedBox() {
    return SizedBox(
      height: 0.01.sw,
    );
  }
}

