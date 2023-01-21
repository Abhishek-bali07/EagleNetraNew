import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/constants.dart';
import '../../helpers_impl/my_dialog_impl.dart';
import '../../utils/dialog_controller.dart';

class SafeAreaDetailsPage extends StatefulWidget {
  const SafeAreaDetailsPage({Key? key}) : super(key: key);

  @override
  State<SafeAreaDetailsPage> createState() => _SafeAreaDetailsPageState();
}

class _SafeAreaDetailsPageState extends State<SafeAreaDetailsPage> {
  final FocusNode inputManager = FocusNode();
  late final List<ReactionDisposer> _disposers;
  late final DialogController dialogController;
  late final TextEditingController textEditingController;

  @override
  void initState(){
    dialogController = DialogController(dialog: MyDialogImpl(buildContext: context));
    textEditingController = TextEditingController();
    super.initState();
    _disposers = [

    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.30.sh,
      decoration: BoxDecoration(
        color: AppColors.White,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (value){},
            decoration: InputDecoration(
              hintText: Constants.addcurrentlocation,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightGray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightGray,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.SilverChalice),
              ),
            ),
          ),
          Text("243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204"),
          Row(
            children: [
              Text("Alert:", style: TextStyle(fontWeight: FontWeight.bold),),
              Observer(builder: (BuildContext context){
                return Expanded(
                  flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value){
                              print(value); //selected value
                            }
                        ),
                        const Text(
                          "Kids",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        )
                      ],
                    )
                );
              }),
              Observer(builder: (BuildContext context){
                return Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value){
                              print(value); //selected value
                            }
                        ),
                        const Text(
                          "Kids",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        )
                      ],
                    )
                );
              }),

            ],
          )
        ],
      ),
    );
  }
}
