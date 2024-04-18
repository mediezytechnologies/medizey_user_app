import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

ThemeData appThemeStyle() {
  return ThemeData(
    scaffoldBackgroundColor: kScaffoldColor,

   // textButtonTheme: GooglFonrts,
    //* appbar
    appBarTheme: AppBarTheme(
      backgroundColor: kScaffoldColor,
      iconTheme: IconThemeData(color: kMainColor),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
