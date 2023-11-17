import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xffCC202E);
  static const primaryLight = Color(0xFF17335B);
  static const black = Colors.black;
  static const white = Color(0xffffffff);
  static const grey = Color(0xff8892aa);
  static const borderGrey = Color(0XFFb5b5bf);
  static const Map<int, Color> primaryPallet = {
    50: Color.fromRGBO(23, 51, 91, .1),
    100: Color.fromRGBO(23, 51, 91, .2),
    200: Color.fromRGBO(23, 51, 91, .3),
    300: Color.fromRGBO(23, 51, 91, .4),
    400: Color.fromRGBO(23, 51, 91, .5),
    500: Color.fromRGBO(23, 51, 91, .6),
    600: Color.fromRGBO(23, 51, 91, .7),
    700: Color.fromRGBO(23, 51, 91, .8),
    800: Color.fromRGBO(23, 51, 91, .9),
    900: primary,
  };
}
