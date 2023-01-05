import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonThemes{static var defaultStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(Size(392.w, 65.h)),
    backgroundColor: MaterialStateProperty.all(AppColors.Black),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))));

static var cancelBtnStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(Size(392.w, 65.h)),
    backgroundColor: MaterialStateProperty.all(AppColors.lightGray),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))));



}
