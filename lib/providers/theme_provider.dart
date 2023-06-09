/* import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class ThemeProvider extends ChangeNotifier{
  late var _theme = 0;
  final arr = [0, 1, 2];

  String get theme => _theme;

  void setTheme(String theme) {
    if (!arr.contains(theme)) return;
    _theme = theme;
    notifyListeners();
  }

  void cleanTheme() {
     _theme = 0;
    notifyListeners();
  }
} */