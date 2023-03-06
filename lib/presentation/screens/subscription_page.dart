import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/helpers/image_assets.dart';
import '../../utils/dialog_controller.dart';

import '../stores/subscription_page_view_model.dart';
import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class SubscriptionPage extends StatefulWidget {
  ShortDetail arguments;
  SubscriptionPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  late final SubscriptionPageViewModel _viewModel;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;



  @override
  void initState() {
    _viewModel = SubscriptionPageViewModel(widget.arguments);
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
        title: Text("Device Subscription"),
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
                return _viewModel.subscrptionHistory.isEmpty
                    ? Center(
                       child: Text("Does not have anyone"),
                )
                    : ListView.separated(
                    itemBuilder: (context, index) => listItem(index),
                    separatorBuilder: (BuildContext context, int index) =>
                        separatedBox(),
                    itemCount: _viewModel.subscrptionHistory.length);
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget listItem(int index) {
    return GestureDetector(
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
          padding: EdgeInsets.symmetric( horizontal: 0.03.sw),
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
                                return _viewModel.subscrptionHistory[index].image.isNotEmpty
                                    ? CircleAvatar(
                                  radius: 0.06.sw,
                                  backgroundColor: AppColors.lightGray,
                                  foregroundImage:
                                  NetworkImage(_viewModel.data!.image),
                                )
                                    : CircleAvatar(
                                  radius: 0.06.sw,
                                  // backgroundColor:
                                  //     AppColors.drawerPrimary,
                                  child: SvgPicture.asset("assets/images/boy.svg"),


                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex:4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only( left: 8.0),
                                  child: _viewModel.subscrptionHistory[index].name
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
                                       "Class:${_viewModel.subscrptionHistory[index].clsName}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, left: 5.0),
                                      child: Text("(Age:${_viewModel.subscrptionHistory[index].age})"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Column(
                            children: [
                                      Text("Expiring On",
                                        style: TextStyle(
                                        fontWeight: FontWeight.w400
                                      ),
                                      ),
                                  SizedBox(height: 0.01.sw),
                                      Text("${_viewModel.onSelectedDate(_viewModel.subscrptionHistory[index].expireDate)}")
                            ],
                          ),
                              ))
                          
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
                                Text("Recharge Now", style: TextStyle(
                                    fontWeight: FontWeight.w400
                                ),),
                                Text("₹${_viewModel.subscrptionHistory[index].rechargeAmount}",
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
}
