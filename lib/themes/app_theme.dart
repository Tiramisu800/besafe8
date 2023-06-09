// import 'package:flutter/material.dart';

// enum AppTheme {
//   Light,
//   Dark,
//   Custom,
// }

// class AppThemeData {
//   static ThemeData lightTheme = ThemeData(
//   brightness: ,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppTheme.whiteColor,
//     titleTextStyle: TextStyle(color:  AppTheme.textcollor),
//   ),
//   colorScheme: ColorScheme.light(
//     background: AppTheme.greyColor, 
//     primary: AppTheme.textcollor, //text
//     secondary: AppTheme.greenColor, //container?
//   ),

//   );
//   static ThemeData darkTheme = ThemeData.dark();

//   static ThemeData customTheme = ThemeData(
//   brightness: Brightness.light,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color(0xff303030),
//     titleTextStyle: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
//   ),
//   colorScheme: ColorScheme.light(
//     background: Color(0xffC3CDD6), 
//     primary: Color.fromARGB(255, 19, 18, 18), 
//     secondary: Color.fromRGBO(234, 153, 153, 1), 
//   ),
//     // Дополнительные настройки пользовательской темы
//   );

//   static ThemeData getThemeData(AppTheme appTheme) {
//     switch (appTheme) {
//       case AppTheme.Light:
//         return lightTheme;
//       case AppTheme.Dark:
//         return darkTheme;
//       case AppTheme.Custom:
//         return customTheme;
//       default:
//         return lightTheme;
//     }
//   }
// }
