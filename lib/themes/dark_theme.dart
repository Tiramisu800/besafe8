import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color textcollor = Color(0xffD6D6D6);
  static const Color greenColor = Color.fromRGBO(62, 180, 137, 1);
  static const Color greyColor = Color.fromARGB(255, 134, 134, 134);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightColor = Color(0xffC3CDD6);
  static const Color darkColor = Color(0xff303030);
  static const map_style = "/assets/map_style.txt";
}


ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: AppTheme.textcollor),
  ),
  colorScheme: ColorScheme.dark(
    background: AppTheme.darkColor, 
    primary: AppTheme.greyColor, //text
    secondary: AppTheme.greenColor,  //container?
  ),
);