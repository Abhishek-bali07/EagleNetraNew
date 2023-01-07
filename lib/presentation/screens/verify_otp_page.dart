import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/presentation/screens/mobileInput_page.dart';
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

  VerifyOtpPage({Key? key, required this.number, required this.onOtp, required this.reSendOtp, required this.reSendingOtpLoader})
      : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {


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
            const Text("OTP has been sent to your mobile number"),
            widget.number.text(AppTextStyle.enterNumberStyle),
            SizedBox(
                width: 0.90.sw,
                child: Pinput(
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
                  keyboardType: TextInputType.number,
                  // validator: (value) {
                  //   return value == '2222' ? null : 'Pin is incorrect';
                  // },
                )),
            FittedBox(
              child: Observer(builder: (BuildContext context) {
                return TextButton(
                    onPressed: widget.reSendingOtpLoader ? null : widget.reSendOtp,
                    child:
                        widget.reSendingOtpLoader ? Text("data") : Text("data1"));
              }),
            )
          ],
        ));
  }
}
