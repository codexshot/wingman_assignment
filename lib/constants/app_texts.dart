

import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppTextStyles {
  static TextStyle Header1WhiteTextStyle = TextStyle(
      color: AppColors.blackTextColor, fontWeight: FontWeight.bold, fontSize: 28.sp);
  static TextStyle Title1WhiteTextStyle = TextStyle(
      color: AppColors.WhiteTextColor,  fontSize: 17.sp);
  static TextStyle Title1BlackTextStyle = TextStyle(
      color: AppColors.textBlackColor,fontSize: 17.sp,);
  static TextStyle Header2TextStyle = TextStyle(
      color: AppColors.blackTextColor, fontWeight: FontWeight.bold, fontSize: 24.sp);
  static TextStyle Title2TextStyle = TextStyle(
      color: AppColors.blackTextColor,  fontSize: 14.sp);

  static TextStyle Header3TextStyle = TextStyle(
      color: AppColors.blackTextColor, fontWeight: FontWeight.bold, fontSize: 16.sp);



}
