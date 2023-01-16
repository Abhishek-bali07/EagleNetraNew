import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eagle_netra/presentation/ui/app_fonts.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextStyle {

  static var countryCodeStyle = TextStyle(
      fontFamily: AppFonts.poppins, fontSize: 18.sp, color: AppColors.Black);

  static var introHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.normal,
      color: AppColors.Gray,
      fontSize: 35.sp,
      decoration: TextDecoration.none);

  static var bodyTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.normal,
      fontSize: 18.sp,
      color: AppColors.Gray,
      decoration: TextDecoration.none);

  static var enterNumberSubHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w200,
      color: AppColors.Acadia,
      fontSize: 16.sp,
      decoration: TextDecoration.none);


  static var enterNumberStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 30.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: AppColors.Acadia);


  static TextStyle userNameStyle = TextStyle(
      fontFamily: AppFonts.fontFamilyPoppins,
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
      color: AppColors.appBlack);


  static var introSubHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w300,
      fontSize: 18.sp,
      color: const Color(0xFF707070));



  static var mandatoryFieldStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: AppColors.Black);


  static var btnTextStyleWhite = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
      color: AppColors.White);

  static var headingTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black);


  static var dialogBtnStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.primaryVariant);


  static var dialogBodyTextStyle = TextStyle(
      fontFamily: AppFonts.poppins, fontSize: 15.sp, color: Colors.black38);
}