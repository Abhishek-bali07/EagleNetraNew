import 'package:custom_check_box/custom_check_box.dart';
import 'package:eagle_netra/core/common/track_alert_button.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/constants.dart';
import '../../core/common/dialog_state.dart';
import '../../helpers_impl/my_dialog_impl.dart';
import '../../utils/dialog_controller.dart';
import '../stores/safe_area_details_view_model.dart';

class SafeAreaDetailsPage extends StatefulWidget {
  const SafeAreaDetailsPage({Key? key}) : super(key: key);

  @override
  State<SafeAreaDetailsPage> createState() => _SafeAreaDetailsPageState();
}

class _SafeAreaDetailsPageState extends State<SafeAreaDetailsPage> {
  late final SafeAreaDetailsViewModel _vm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController dialogController;
  late final TextEditingController textEditingController;
  bool shouldCheck = false;
  @override
  void initState(){
    dialogController = DialogController(dialog: MyDialogImpl(buildContext: context));
    _vm = SafeAreaDetailsViewModel();
    textEditingController = TextEditingController();
    super.initState();
    _disposers = [
      reaction((p0) => _vm.dialogManager.currentErrorState, (p0) async {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          await dialogController.show(_vm.dialogManager.errorData!, p0,
              positive: _vm.onRetry,
              close: _vm.dialogManager.closeErrorDialog);
        }
      }),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          color: AppColors.White,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    _vm.onNameChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: Constants.addcurrentlocation,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appBlack,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appBlack,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.SilverChalice),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Alert:", style: TextStyle(fontWeight: FontWeight.bold),),
                    Observer(builder: (BuildContext context){
                      return  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value:AlertRadio.entry,
                                  groupValue:_vm.selected,
                                  activeColor: AppColors.greenPrimary,
                                  onChanged: _vm.onRadioSelected,
                              ),
                              const Text(
                                "Entry",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                    }),
                    Observer(builder: (BuildContext context){
                      return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value:AlertRadio.exit,
                                groupValue:_vm.selected,
                                activeColor: AppColors.greenPrimary,
                                onChanged: _vm.onRadioSelected,
                              ),
                              const Text(
                                "Exit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );

                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:AppColors.greenPrimary,
                            textStyle:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          child: Text("Add Now"),

                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
