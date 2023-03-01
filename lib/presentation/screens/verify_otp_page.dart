
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpPage extends StatefulWidget {
  String number;
  bool reSendingOtpLoader;
  //String onOtp;
  Function(String) onOtp;
  Function() reSendOtp;


  VerifyOtpPage({Key? key, required this.number, required this.onOtp, required this.reSendingOtpLoader,required this.reSendOtp})
      : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {


  @override
  Widget build(BuildContext context) {

    return Container(
        height: 0.40.sh,
        decoration: BoxDecoration(
          color: AppColors.White,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0.04.sw),
              child: Container(
                height: 0.02.sw,
                width: 0.10.sh,
                decoration: BoxDecoration(
                    color: AppColors.drawerPrimary,
                    borderRadius: BorderRadius.circular(20.r)),
              ),
            ),
            const Text("OTP has been sent to your mobile number"),
            widget.number.text(AppTextStyle.enterNumberStyle),
            SizedBox(
                width: 0.90.sw,
                child: Pinput(
                  autofocus: true,
                  defaultPinTheme: PinTheme(
                    width: 65.w,
                    height: 65.h,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 65.w,
                    height: 65.h,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryVariant),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100),
                  ),
                  separator: SizedBox(
                    width: 0.05.sw,
                  ),
                  onCompleted: widget.onOtp,
                  onChanged: (value) {
                    widget.onOtp(value);
                  },
                 // validator: vm.validateOtp,
                  // validator: (value) {
                  //   return value == '2222' ? null : 'Pin is incorrect';
                  // },
                  keyboardType: TextInputType.number,
                )),
            FittedBox(
              child:  TextButton(
                    onPressed: widget.reSendingOtpLoader ? null : widget.reSendOtp,
                    child: widget.reSendingOtpLoader
                        ? Text(StringProvider.Recieving)
                        : Text(StringProvider.resendotp))

            )
          ],
        ));
  }
}
