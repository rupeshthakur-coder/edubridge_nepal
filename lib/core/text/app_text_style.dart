import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../color/my_app_color.dart';

class TextStyles {
  // Regular text style with size 16 and primary text color
  static TextStyle poppinsRegularSize16ColorPrimary() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: MyAppColors.textColorPrimary,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Bold text style with size 18 and black color
  static TextStyle poppinsBoldSize18ColorBlack() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 18.sp,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Medium weight text style with size 14 and secondary gray color
  static TextStyle poppinsMediumSize14ColorGray() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 14.sp,
        color: MyAppColors.textColorSecondary,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Light weight text style with size 12 and white color
  static TextStyle poppinsLightSize12ColorWhite() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 12.sp,
        color: MyAppColors.textColorLight,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  // Italic text style with size 20 and primary color
  static TextStyle poppinsItalicSize20ColorPrimary() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: MyAppColors.primaryColor,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Extra-large bold text style for headings with size 24 and custom color
  static TextStyle poppinsExtraLargeBoldSize24ColorCustom() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 24.sp,
        color: MyAppColors.primaryColor, // Use appropriate color
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Error text style with size 16 and error color
  static TextStyle poppinsErrorSize16ColorError() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: MyAppColors.textColorError,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Success text style with size 16 and success color
  static TextStyle poppinsSuccessSize16ColorSuccess() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: MyAppColors.textColorSuccess,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Warning text style with size 16 and warning color
  static TextStyle poppinsWarningSize16ColorWarning() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: MyAppColors.textColorWarning,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
