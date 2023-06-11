import 'package:localstorage/localstorage.dart';
import 'dart:ui';

class StorageUtil {
  static final LocalStorage _storage = LocalStorage('my_app');

  static Future<void> setLanguage(String languageCode) async {
    await _storage.setItem('language', languageCode);
  }

  static String getLanguage() {
    return _storage.getItem('language') ?? window.locale.languageCode ?? 'kk'; // Значение по умолчанию, если язык не найден
  }
}