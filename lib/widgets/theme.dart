import 'package:flutter/material.dart';
import 'package:besafe/themes/app_theme.dart';
import 'package:besafe/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var localizedStrings = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        themeSwitcher(themeProvider, ThemeType.Light, localizedStrings!.light, Icon(Icons.light, color: Colors.white,) ),
        themeSwitcher(themeProvider, ThemeType.Dark, localizedStrings.dark, Icon(Icons.nights_stay_sharp, color: Colors.black,)),
        themeSwitcher(themeProvider, ThemeType.Custom,localizedStrings.custom, Icon(Icons.brightness_7, color: Colors.pink,)),
        
      ],
    );
  }

  Widget themeSwitcher(ThemeProvider themeProvider, ThemeType type, String text, Icon icon) {
    return Column(
      children: [
        IconButton(
            icon:icon,
            onPressed: () => themeProvider.setTheme(type),
          ),
        Text(text),
      ],
    );
  }
}