// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get numsCheck => 'Numbers';

  @override
  String get numsSubtitleCheck => 'Add Numbers to your password';

  @override
  String get lowcaseCheck => 'Lower Letters';

  @override
  String get lowcaseSubtitleCheck => 'Add Lower Case Letters to your password';

  @override
  String get capitalLetCheck => 'Capital Letters';

  @override
  String get capitalLetSubtitleCheck => 'Add Capital Letters to your password';

  @override
  String get symsCheck => 'Symbols';

  @override
  String get symsSubtitleCheck => 'Add Symbols to your password';

  @override
  String get passwordLabelText => 'Password';

  @override
  String get genButton => 'Generate Password';

  @override
  String get copyButtonTooltip => 'Copy to Clipboard';

  @override
  String get copySnackBarMessage => 'Copied to Clipboard';

  @override
  String get settingsAppBarTitle => 'Settings';

  @override
  String get symsUsedLabelText => 'Symbols in Use';

  @override
  String get symsUsedRestoreButtonTooltip => 'Restore to default';

  @override
  String get license => 'License';

  @override
  String get sourceCode => 'Source Code';

  @override
  String get copylinkbutton => 'Copy Link';

  @override
  String get helpWithTranslationInfoButtonTooltip =>
      'Helping with translation would be a huge slay.';
}
