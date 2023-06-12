// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:besafe/views/decision_screen/decission_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'controller/auth_controller.dart';
// import 'firebase_options.dart';
// import 'l10n/l10n.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:besafe/providers/locale_provider.dart';
// import 'package:besafe/providers/theme_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:besafe/themes/app_theme.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     final themeData = sharedPreferences.getString(kThemeKey);
//     ThemeData theme;
//     if (themeData != null) {
//       theme = getThemeFromEnum(ThemeType.values.byName(themeData));
//     } else {
//       theme = customTheme;
//     }
//  runApp(
//   MultiProvider(
//     providers: [
//       ChangeNotifierProvider<LocaleProvider>(create: (context) => LocaleProvider(),),
//       ChangeNotifierProvider<ThemeProvider> (create: (context) => ThemeProvider(initialTheme: theme),
// ),

//     ],
//     child: MyApp(),
//   )

//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthController authController = Get.put(AuthController());
//     authController.decideRoute();
//     print(Provider.of<ThemeProvider>(context).currentTheme);
//     //final textTheme = Theme.of(context).textTheme;
//     //final providerthem = Provider.of<ThemeProvider>(context);

//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       // themeMode: ThemeMode.system,
//       // theme: ThemeData(
//       //   textTheme: GoogleFonts.poppinsTextTheme(textTheme),
//       // ),
//       theme: Provider.of<ThemeProvider>(context).currentTheme,
//       locale: Provider.of<LocaleProvider>(context).locale,
//       supportedLocales: L10n.all,
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: const DecisionScreen(),
//     );
//   }
// }


import 'dart:async'; // Import the Timer class

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:besafe/views/decision_screen/decission_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:besafe/providers/locale_provider.dart';
import 'package:besafe/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:besafe/themes/app_theme.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final themeData = sharedPreferences.getString(kThemeKey);
  ThemeData theme;
  if (themeData != null) {
    theme = getThemeFromEnum(ThemeType.values.byName(themeData));
  } else {
    theme = customTheme;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(
          create: (context) => LocaleProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(initialTheme: theme),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthController authController;
  late ConnectivityResult connectivityResult;
  late Timer connectivityTimer;

  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());

    checkConnectivity(); // Check connectivity initially
    // Start a timer to check connectivity every 10 seconds
    connectivityTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      checkConnectivity();
    });
  }

  @override
  void dispose() {
    connectivityTimer.cancel(); // Cancel the timer when the app is disposed
    super.dispose();
  }

  void checkConnectivity() async {
    var newConnectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      connectivityResult = newConnectivityResult;
    });

    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Internet Connection'),
            content: Text('Please check your network settings.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<ThemeProvider>(context).currentTheme);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      locale: Provider.of<LocaleProvider>(context).locale,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Builder(
        builder: (context) {
          if (connectivityResult == null) {
            // Show loading indicator while checking connectivity
            return CircularProgressIndicator();
          } else if (connectivityResult == ConnectivityResult.none) {
            // Show error message if there is no internet connection
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Internet Connection',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Retry'),
                      onPressed: checkConnectivity,
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Proceed with the DecisionScreen if there is internet connection
            return DecisionScreen();
          }
        },
      ),
    );
  }
}
