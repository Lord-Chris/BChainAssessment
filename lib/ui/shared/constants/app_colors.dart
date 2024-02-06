import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Neutral Colors
  static const white = Color(0XFFFFFFFF);
  static const black = Color(0XFF000000);
  static const transparent = Colors.transparent;

  // ----------------------Named Colors From UI------------------
  static const primary600 = Color(0XFF004CCC);
  static const primary700 = Color(0XFF003999);
  static const gray300 = Color(0XFFD0D5DD);
  static const gray600 = Color(0XFF475467);
  static const gray700 = Color(0XFF344054);
  static const gray900 = Color(0XFF101828);
  // static const deepBlue = Color(0XFF);
  // static const deepBlue = Color(0XFF);
  // static const deepBlue = Color(0XFF);

  static const brandColor1 = Color(0XFF5A50FE);
  static const brandColor2 = Color(0XFF9328FF);
  static const brandColor3 = Color(0XFF4CBFFF);
  static const errorNotStrong = Color(0XFFE95354);
  static const strongAttention = Color(0XFFDFB624);
  static const audioCallTag = Color(0XFF1DB385);
  static Color get strongPassed => audioCallTag;

  //
  // ------------------Unnamed Colors---------------------
  // static const deepBlue = Color(0XFF1C1939);
  // static const deepBlue = Color(0XFF1C1939);
}
