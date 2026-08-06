import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @numsCheck.
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get numsCheck;

  /// No description provided for @numsSubtitleCheck.
  ///
  /// In en, this message translates to:
  /// **'Add Numbers to your password'**
  String get numsSubtitleCheck;

  /// No description provided for @lowcaseCheck.
  ///
  /// In en, this message translates to:
  /// **'Lower Letters'**
  String get lowcaseCheck;

  /// No description provided for @lowcaseSubtitleCheck.
  ///
  /// In en, this message translates to:
  /// **'Add Lower Case Letters to your password'**
  String get lowcaseSubtitleCheck;

  /// No description provided for @capitalLetCheck.
  ///
  /// In en, this message translates to:
  /// **'Capital Letters'**
  String get capitalLetCheck;

  /// No description provided for @capitalLetSubtitleCheck.
  ///
  /// In en, this message translates to:
  /// **'Add Capital Letters to your password'**
  String get capitalLetSubtitleCheck;

  /// No description provided for @symsCheck.
  ///
  /// In en, this message translates to:
  /// **'Symbols'**
  String get symsCheck;

  /// No description provided for @symsSubtitleCheck.
  ///
  /// In en, this message translates to:
  /// **'Add Symbols to your password'**
  String get symsSubtitleCheck;

  /// No description provided for @passwordLabelText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabelText;

  /// No description provided for @genButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Password'**
  String get genButton;

  /// No description provided for @copyButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy to Clipboard'**
  String get copyButtonTooltip;

  /// No description provided for @copySnackBarMessage.
  ///
  /// In en, this message translates to:
  /// **'Copied to Clipboard'**
  String get copySnackBarMessage;

  /// No description provided for @settingsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsAppBarTitle;

  /// No description provided for @symsUsedLabelText.
  ///
  /// In en, this message translates to:
  /// **'Symbols in Use'**
  String get symsUsedLabelText;

  /// No description provided for @symsUsedRestoreButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Restore to default'**
  String get symsUsedRestoreButtonTooltip;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @copylinkbutton.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get copylinkbutton;

  /// No description provided for @helpWithTranslationInfoButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Helping with translation would be a huge slay.'**
  String get helpWithTranslationInfoButtonTooltip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'el', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
