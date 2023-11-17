import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    primarySwatch:
        MaterialColor(AppColors.primary.value, AppColors.primaryPallet),
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    textButtonTheme: TextButtonThemeData(style: primaryTextButtonStyle),
    unselectedWidgetColor: Colors.white,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    color: Colors.black,
    centerTitle: true,
    titleTextStyle: appBarTitleTheme,
    iconTheme: appBarIconTheme,
    shadowColor: const Color.fromARGB(45, 0, 0, 0),
    // elevation: 1
  );

  static IconThemeData appBarIconTheme = const IconThemeData(
    color: AppColors.white,
  );

  static TextStyle appBarTitleTheme = const TextStyle();

  static TextTheme textTheme = TextTheme(
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
    bodySmall: bodyText3,
  );

  static TextStyle bodyText1 = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 32.sp, color: Colors.black);

  static TextStyle bodyText2 = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black);

  static TextStyle bodyText3 = GoogleFonts.inter(
      fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.black);

  static ButtonStyle primaryTextButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      padding:  EdgeInsets.symmetric(vertical: 14.h, horizontal: 23.w).r,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: AppColors.primary,
      textStyle: buttonTextStyle);

  static const buttonTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.white);
}
