import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/dialog_controller.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:switch_button/switch_button.dart';
import '../../core/common/dialog_state.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/image_assets.dart';
import '../stores/safearea_page_view_model.dart';
import '../ui/app_text_style.dart';

class SafeAreaPage extends StatefulWidget {
  ShortDetails arguments;
  SafeAreaPage({Key? key,required this.arguments}) : super(key: key);

  @override
  State<SafeAreaPage> createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
  late final SafeAreaPageViewModel _vm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;
 // bool state = false;

  @override
  void initState() {
    _vm = SafeAreaPageViewModel(widget.arguments);

    super.initState();
    _disposers = [
      reaction((p0) => _vm.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_vm.dialogManager.errorData!, p0,
              positive: _vm.onError, close: _vm.dialogManager.closeErrorDialog);
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
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("SafeArea"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SilverChalice,
        foregroundColor: AppColors.Black,
        onPressed: (){
          _vm.onAddSafeareaSection(_vm.data);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex:1,child: _upperSideContent()),
            Expanded(flex: 8, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(
              builder: (BuildContext context) {
                return _vm.image.isNotEmpty
                    ? CircleAvatar(
                  radius: 0.06.sw,
                  backgroundColor: AppColors.lightGray,
                  foregroundImage:
                  NetworkImage(_vm.image),
                )
                    : CircleAvatar(
                  radius: 0.06.sw,
                  // backgroundColor:
                  //     AppColors.drawerPrimary,
                      child: SvgPicture.asset(
                      "assets/images/boy.svg"),
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(top: 8.0, left: 8.0),
                child: widget.arguments.name
                    .text(AppTextStyle.userNameStyle),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 8.0),
                    child: Text("Class:${widget.arguments.clsName}"),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 8.0),
                    child: Text("(Age:${widget.arguments.age})"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2 ,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SvgPicture.asset(ImageAssets.home),
          ),
        ),
      ],
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
              if (_vm.isLoading) {
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
                return _vm.safeAreaList.isEmpty
                    ? Center(
                        child: Text("Does not have anyone"),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => listItem(index),
                        separatorBuilder: (BuildContext context, int index) =>
                            separatedBox(),
                        itemCount: _vm.safeAreaList.length);
              }
            }),
          ),
        ),
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
        child: Column(
          children: [
            Observer(
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    SwitchButton(
                      value: _vm.safeAreaList[index].state,
                      onToggle: (val) {
                        _vm.switcherData(_vm.safeAreaList[index], changedState: (state){
                          setState(() {
                            _vm.safeAreaList[index].state = state;
                          });
                        });
                      },
                      child: Text(_vm.safeAreaList[index].locationName),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SafeArea(
                              child: Text(
                                _vm.safeAreaList[index].address,
                                style: TextStyle(
                                  color: AppColors.lightGray,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alert on:${_vm.safeAreaList[index].alertOn}"),
                          Text("Radius:${_vm.safeAreaList[index].radius}"),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
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
}
