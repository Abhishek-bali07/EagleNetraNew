import 'package:custom_check_box/custom_check_box.dart';
import 'package:eagle_netra/core/common/lat_long.dart';
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
import '../stores/add_safe_area_view_model.dart';
import '../stores/safe_area_details_view_model.dart';

class SafeAreaDetailsPage extends StatefulWidget {
  const SafeAreaDetailsPage({Key? key, required this.parentVM})
      : super(key: key);
  final AddSafeAreaPageViewModel parentVM;

  @override
  State<SafeAreaDetailsPage> createState() => _SafeAreaDetailsPageState();
}

class _SafeAreaDetailsPageState extends State<SafeAreaDetailsPage> {
  late final DialogController dialogController;
  late final TextEditingController textEditingController;


  // bool shouldCheck = false;

  @override
  void initState() {
    dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    textEditingController = TextEditingController();
    super.initState();
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
                    widget.parentVM.onNameChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: Constants.addcurrentlocation,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appBlack,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appBlack,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.SilverChalice),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Observer(
                    builder: (context) =>
                        widget.parentVM.locationAddress != null
                            ?  Center(child: Text(widget.parentVM.locationAddress))
                            : const SizedBox.shrink(),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Alert:",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),
                    ),

                    Observer(builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            value: widget.parentVM.valuefirst,
                            onChanged:widget.parentVM.onCheckFirst,
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
                    Observer(builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            value: widget.parentVM.valuesecond,
                            onChanged: widget.parentVM.onCheckSecond,
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
                      padding:EdgeInsets.only(left: 50.0),
                      child: Observer(
                        builder: (BuildContext context) {
                          return ElevatedButton(
                          onPressed: widget.parentVM.addNow,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(20, 40),
                              backgroundColor: AppColors.greenPrimary,
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child: widget.parentVM.uploadingLoader
                              ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                              : Text(
                                  "Add Now", style: TextStyle(fontSize: 14.sp))
                        );
                      },

                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Slider(
                  //label:'${widget.parentVM.radius.round()}',
                  value: widget.parentVM.radius,
                  onChanged: (double value) {
                    setState(() {
                      widget.parentVM.setRadius(value);
                      var latLng = widget.parentVM.markers.first.position;
                      widget.parentVM.setupCircle(
                          LatLong(lat: latLng.latitude, lng: latLng.longitude));
                    });
                  },
                  min: 100,
                  max: 1000,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Text("Radius:${widget.parentVM.radius.toInt()}m",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
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



// Radio(
//   value: AlertRadio.entry,
//   groupValue: widget.parentVM.selected,
//   activeColor: AppColors.greenPrimary,
//   onChanged: widget.parentVM.onRadioSelected,
// ),