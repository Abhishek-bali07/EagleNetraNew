import 'package:eagle_netra/core/common/constants.dart';
import 'package:eagle_netra/core/common/dialog_state.dart';
import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/helpers_impl/my_dialog_impl.dart';
import 'package:eagle_netra/presentation/custom_widgets/mobile_number_with_code_text_field.dart';
import 'package:eagle_netra/presentation/screens/verify_otp_page.dart';
import 'package:eagle_netra/presentation/stores/mobileInput_page_view_model.dart';
import 'package:eagle_netra/presentation/ui/app_button_themes.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/dialog_controller.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobx/mobx.dart';

class MobileInput extends StatefulWidget {
  MobileInput({Key? key}) : super(key: key);

  @override
  State<MobileInput> createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  final FocusNode inputManager = FocusNode();
  late final TextEditingController _mobileNumberInputController;
  late final List<ReactionDisposer> _disposers;
  late final DialogController dialogController;
  late final MobileInputViewModel vm;

  @override
  void initState() {
    dialogController = DialogController(dialog: MyDialogImpl(buildContext: context));
    vm = MobileInputViewModel();
    _mobileNumberInputController = TextEditingController(text: vm.mobileNumber);
    super.initState();

    _disposers = [
      reaction((p0) => vm.dialogManager.currentErrorState, (p0) async {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          await dialogController.show(vm.dialogManager.errorData!, p0,
              positive: vm.onRetry,
              close: vm.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => vm.isShow, (p0) async {
      if(p0 == true){
        await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return VerifyOtpPage(
                onOtp: vm.onUserOtp,
                number: vm.mobileNumber, reSendingOtpLoader: vm.reSendingOtpLoader, reSendOtp: vm.reSendOtp
              );
            });
        vm.isShow = false;
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
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 3, child: _upperSideContent()),
            Expanded(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            expand(flex: 7, child: Image.asset(ImageAssets.logo)),
            expand(flex: 3, child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register or Sign In",
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in or register with Otp verifications.",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            expand(
                flex: 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: fitBox(child: Observer(
                    builder: (BuildContext context) {
                      return MobileNumberWithCodesTextField(
                        key: ObjectKey(vm.sendingLoader),
                        node: inputManager,
                        controller: _mobileNumberInputController,
                        onTextChange: (number) {
                          if (number.length == 12) {
                            inputManager.unfocus();
                          }
                          vm.onNumberChange(number);
                        },
                        onNumberCleared: vm.onNumberClear,
                        gettingLoader: vm.gettingDataLoader,
                      );
                    },
                  )).padding(insets: EdgeInsets.only(top: 0.06.sh)),
                )),
            expand(
                flex: 7,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Observer(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                          style: vm.enableBtn
                              ? AppButtonThemes.defaultStyle
                              : AppButtonThemes.cancelBtnStyle,
                          onPressed: vm.enableBtn ? vm.onNext : null,
                          child: vm.sendingLoader
                              ? const CircularProgressIndicator(
                                  color: Colors.red,
                                )
                              : Text(
                                  Constants.mobileinputsubmit,
                                  style: AppTextStyle.btnTextStyleWhite,
                                ));
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
