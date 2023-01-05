import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:eagle_netra/utils/number_textInput_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/domain/mobile_number_code.dart';

import '../ui/theme.dart';

class MobileNumberWithCodesTextField extends StatefulWidget {
   FocusNode node;
   TextEditingController controller;
   Function(String) onTextChange;
   Function onNumberCleared;
   bool gettingLoader;
   bool? isMandatory;
   Key key;

   MobileNumberWithCodesTextField(
       {required this.key,
          required this.node,
          required this.controller,
          required this.onTextChange,
          required this.onNumberCleared,
          this.isMandatory,
          required this.gettingLoader})
       : super(key: key);

   @override
   State<MobileNumberWithCodesTextField> createState() =>
       _MobileNumberWithCodesTextFieldState(
           inputManager: node,
           inputController: controller,
           onChange: onTextChange,
           onClear: onNumberCleared,
           loader: gettingLoader,
           myKey: key);
}

class _MobileNumberWithCodesTextFieldState
    extends State<MobileNumberWithCodesTextField> {
   FocusNode inputManager;
   TextEditingController inputController;
   Function(String) onChange;
   Function onClear;
   bool loader;
   Key myKey;

   _MobileNumberWithCodesTextFieldState(
       {required this.inputManager,
          required this.inputController,
          required this.onChange,
          required this.onClear,
          required this.loader,
          required this.myKey});

   @override
   void initState() {
      super.initState();
   }

   @override
   void dispose() {
      super.dispose();
   }

   @override
   Widget build(BuildContext context) {
      return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Padding(
               padding: widget.isMandatory != null && widget.isMandatory! ? EdgeInsets.only(bottom: 0.03.sw) : EdgeInsets.zero,
               child: Container(
                  key: myKey,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                         BoxShadow(
                            color: AppColors.lightGray,
                            offset: Offset(
                               5.0,
                               5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                         ), //BoxShadow
                         BoxShadow(
                            color: AppColors.lightGray,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                         ), //BoxShadow
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                 child: FittedBox(
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       // SizedBox(
                       //   width: 0.25.sw,
                       //   height: 0.15.sw,
                       //   child: CountryCodesDropDown(
                       //     dialCodes: dialCodes,
                       //     onSelect: onSelect,
                       //     gettingLoader: loader,
                       //   ),
                       // ),
                       SizedBox(
                           width: 0.90.sw,
                           height: 0.15.sw,
                           child: _mobileNumberInputContent())
                     ],
                   ),
                 ),
               ),
            ),
            if(widget.isMandatory != null && widget.isMandatory!) StringProvider.thisFieldIsMandatory.text(AppTextStyle.mandatoryFieldStyle)
         ],
      );
   }

   Widget _mobileNumberInputContent() {
      return TextField(
         focusNode: inputManager,
         mouseCursor: MouseCursor.defer,
         controller: inputController,
         onTap: () {
            FocusScope.of(context).requestFocus(inputManager);
         },
         onChanged: onChange,
         decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: StringProvider.mobileNumber,
            border: OutlineInputBorder(
                borderSide:  BorderSide(
                   color: AppColors.Black,
                )),
            focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(10.r),
                //     bottomRight: Radius.circular(10.r)),
                borderSide: BorderSide(
                   color: AppColors.Black,
                )),
            enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(10.r),
                //     bottomRight: Radius.circular(10.r)),
                borderSide:  BorderSide(
                   color: AppColors.Black,
                )),
            suffixIcon: Padding(
               padding: EdgeInsets.all(18.w),
               child: InkWell(
                  onTap: () {
                     inputController.text = "";
                     inputManager.unfocus();
                     onClear();
                  },
                  child: SvgPicture.asset(
                     ImageAssets.clearText,
                     width: 17.w,
                     height: 17.h,
                  ),
               ),
            ),
         ),
         style: AppTextStyle.countryCodeStyle,
         keyboardType: TextInputType.phone,
         inputFormatters: [NumberTextInputFormatter()],
      );
   }
}
