import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// Hello world text
  ///
  /// In en, this message translates to:
  /// **'Hello world!'**
  String get helloworld;

  /// titleprofile
  ///
  /// In en, this message translates to:
  /// **'Let’s Get Started!'**
  String get titleprofile;

  /// subtitleprofile
  ///
  /// In en, this message translates to:
  /// **'Complete the profile Details'**
  String get subtitleprofile;

  /// name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Please enter a valid name!
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name!'**
  String get nameval;

  /// nameisreg
  ///
  /// In en, this message translates to:
  /// **'Name is required!'**
  String get nameisreg;

  /// email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// emailisreg
  ///
  /// In en, this message translates to:
  /// **'Email is required!'**
  String get emailisreg;

  /// emailvalid
  ///
  /// In en, this message translates to:
  /// **'Enter valid email.'**
  String get emailvalid;

  /// submit
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// plsaddim
  ///
  /// In en, this message translates to:
  /// **'Please add your image'**
  String get plsaddim;

  /// helloword
  ///
  /// In en, this message translates to:
  /// **'Good Morning, Be safe!'**
  String get helloword;

  /// wherego
  ///
  /// In en, this message translates to:
  /// **'Where are you going?'**
  String get wherego;

  /// destination
  ///
  /// In en, this message translates to:
  /// **'Destination:'**
  String get destination;

  /// searchfordest
  ///
  /// In en, this message translates to:
  /// **'Search for a destination'**
  String get searchfordest;

  /// from
  ///
  /// In en, this message translates to:
  /// **'From:'**
  String get from;

  /// pah
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get pah;

  /// rih
  ///
  /// In en, this message translates to:
  /// **'Ride History'**
  String get rih;

  /// invite text
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get invite;

  /// promo text
  ///
  /// In en, this message translates to:
  /// **'Promo Codes'**
  String get promo;

  /// settings text
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// support text
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// logout text
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// mptitle text
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get mptitle;

  /// homer text
  ///
  /// In en, this message translates to:
  /// **'Home Address'**
  String get home;

  /// homeisreg text
  ///
  /// In en, this message translates to:
  /// **'Home Address is required!'**
  String get homeisreg;

  /// businnesadd text
  ///
  /// In en, this message translates to:
  /// **'Business Address'**
  String get businnesadd;

  /// businnesaddisreg text
  ///
  /// In en, this message translates to:
  /// **'Business Address is required!'**
  String get businnesaddisreg;

  /// Shopping Center text
  ///
  /// In en, this message translates to:
  /// **'Shopping Center'**
  String get shop;

  /// Shopping Center is required text
  ///
  /// In en, this message translates to:
  /// **'Shopping Center is required!'**
  String get shopisreg;

  /// Update text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Log As Driver text
  ///
  /// In en, this message translates to:
  /// **'Login As Driver'**
  String get logasd;

  /// Log As User text
  ///
  /// In en, this message translates to:
  /// **'Login As User'**
  String get logasu;

  /// english
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// russian
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// kazakh
  ///
  /// In en, this message translates to:
  /// **'Kazakh'**
  String get kazakh;

  /// back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kk': return AppLocalizationsKk();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
