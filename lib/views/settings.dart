import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:besafe/providers/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final selectedLanguage = localeProvider.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                RadioListTile<Locale>(
                  title: Text(AppLocalizations.of(context)!.english),
                  value: Locale('en'),
                  groupValue: selectedLanguage,
                  onChanged: (Locale? newValue) {
                    if (newValue != null) {
                      localeProvider.setLocale(newValue);
                    }
                  },
                ),
                RadioListTile<Locale>(
                  title: Text(AppLocalizations.of(context)!.kazakh),
                  value: Locale('kk'),
                  groupValue: selectedLanguage,
                  onChanged: (Locale? newValue) {
                    if (newValue != null) {
                      localeProvider.setLocale(newValue);
                    }
                  },
                ),
                RadioListTile<Locale>(
                  title: Text(AppLocalizations.of(context)!.russian),
                  value: Locale('ru'),
                  groupValue: selectedLanguage,
                  onChanged: (Locale? newValue) {
                    if (newValue != null) {
                      localeProvider.setLocale(newValue);
                    }
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Применить выбранный язык и обновить страницу
                    Get.updateLocale(selectedLanguage);
                    Get.forceAppUpdate();
                  },
                  child: Text(AppLocalizations.of(context)!.submit),
                ),
              ],
            ),
          ),
/*           Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ), */
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Вернуться на предыдущую страницу
            },
            child: Text(AppLocalizations.of(context)!.back),
          ),
        ],
      ),
    );
  }
}
