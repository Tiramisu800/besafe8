import 'package:flutter/material.dart';
import 'package:besafe/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType {    
  Light,
  Dark,
  Custom }

const kThemeKey = "theme";

class ThemeProvider extends ChangeNotifier { 
  ThemeData _currentTheme;

  ThemeProvider({required ThemeData initialTheme})
      : _currentTheme = initialTheme;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeType type) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(kThemeKey, type.name.toString());
    _currentTheme = getThemeFromEnum(type);
    notifyListeners();
  }

  // getTheme() async {
    
  //   _currentTheme = theme;
  // }
}

ThemeData getThemeFromEnum(ThemeType type) {
     switch (type) {
       case ThemeType.Light:
         return lightTheme;
       case ThemeType.Dark:
         return darkTheme;
       case ThemeType.Custom:
         return customTheme;
       default:
         return customTheme;
     }
   }
