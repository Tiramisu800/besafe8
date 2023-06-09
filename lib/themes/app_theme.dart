import 'package:flutter/material.dart';

   final ThemeData lightTheme = ThemeData(
   brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
     backgroundColor: Color(0xffFFFFFF),
     titleTextStyle: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
   ),
   colorScheme: ColorScheme.light(
     background: Color(0xffD6D6D6),
     primary: Color.fromARGB(255, 19, 18, 18), //text
     secondary: Color(0xFF4CE5B1), //container?
   ),

   );
   final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Color(0xffD6D6D6)),
  ),
  colorScheme: ColorScheme.dark(
    background: Color(0xff303030), 
    primary: Color.fromARGB(255, 134, 134, 134), //text
    secondary: Color.fromRGBO(41, 128, 96, 1),  //container?
  ),
   );

   final ThemeData customTheme = ThemeData(
   brightness: Brightness.light,
   appBarTheme: const AppBarTheme(
     backgroundColor: Color(0xff303030),
     titleTextStyle: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
   ),
   colorScheme: ColorScheme.light(
     background: Color.fromRGBO(234, 153, 153, 1), 
     primary: Color.fromARGB(255, 19, 18, 18), 
     secondary: Color.fromRGBO(206, 112, 112, 1), 
  ),
     // Дополнительные настройки пользовательской темы
   );
   
