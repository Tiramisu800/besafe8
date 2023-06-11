import 'package:flutter/material.dart';
import 'package:besafe/l10n/l10n.dart';
import 'package:localstorage/localstorage.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale = Locale('kk');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('kk');
    notifyListeners();
  }
}