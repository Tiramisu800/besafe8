import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color textcollor = Color(0xff303030);
  static const Color greenColor = Color(0xFF4CE5B1);
  static const Color greyColor = Color(0xffD6D6D6);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightColor = Color(0xffC3CDD6);
  static const Color darkColor = Color(0xff303030);
  static const map_style = "/assets/map_style.txt";
}

ThemeData lighttheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppTheme.whiteColor,
    titleTextStyle: TextStyle(color:  AppTheme.textcollor),
  ),
  colorScheme: ColorScheme.light(
    background: AppTheme.greyColor, 
    primary: AppTheme.textcollor, //text
    secondary: AppTheme.greenColor, //container?
  ),
);