import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VerifyOtpPage extends StatefulWidget {
  AlertData argument;
  String number;

 VerifyOtpPage({Key? key, required this.argument,required this.number}) : super(key: key);

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
            widget.argument.title
            .text(AppTextStyle.headingTextStyle),

            widget.number
            .text(AppTextStyle.enterNumberStyle),

            // SizedBox(
            //   width: 0.90.sw,
            //   child: Pinput(
            //     defaultPinTheme: PinTheme(
            //       width: 65.w,
            //       height: 65.h,
            //       textStyle: const TextStyle(
            //           fontSize: 20,
            //           color: Color.fromRGBO(30, 60, 87, 1),
            //           fontWeight: FontWeight.w600),
            //       decoration: BoxDecoration(
            //           border:
            //           Border.all(color: Colors.grey.shade300),
            //           borderRadius: BorderRadius.circular(20),
            //           color: Colors.grey.shade100),
            //     ),
            //     focusedPinTheme: PinTheme(
            //       width: 65.w,
            //       height: 65.h,
            //       textStyle: const TextStyle(
            //           fontSize: 20,
            //           color: Color.fromRGBO(30, 60, 87, 1),
            //           fontWeight: FontWeight.w600),
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               color: AppColors.primaryVariant),
            //           borderRadius: BorderRadius.circular(20),
            //           color: Colors.grey.shade100),
            //     ),
            //     separator: SizedBox(
            //       width: 0.05.sw,
            //     ),
            //     onCompleted: (pin) {
            //       debugPrint('onCompleted: $pin');
            //     },
            //     onChanged: (value) {
            //       debugPrint('onChanged: $value');
            //     },
            //     keyboardType: TextInputType.number,
            //     validator: (value) {
            //       return value == '2222' ? null : 'Pin is incorrect';
            //     },
            //   )),

          ],
        )
    );
  }
}
