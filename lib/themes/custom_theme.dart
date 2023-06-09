import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color textcollor = Color.fromARGB(255, 19, 18, 18);
  static const Color greenColor = Color.fromRGBO(234, 153, 153, 1);
  static const Color greyColor = Color.fromARGB(255, 179, 171, 171);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightColor = Color(0xffC3CDD6);
  static const Color darkColor = Color(0xff303030);
  static const map_style = "/assets/map_style.txt";
}


ThemeData customtheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppTheme.darkColor,
    titleTextStyle: TextStyle(color:  AppTheme.textcollor),
  ),
  colorScheme: ColorScheme.light(
    background: AppTheme.lightColor, 
    primary: AppTheme.textcollor, //text
    secondary: AppTheme.greenColor, //container?
  ),
);