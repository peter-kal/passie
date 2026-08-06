// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get numsCheck => 'Zahlen';

  @override
  String get numsSubtitleCheck => 'Zahlen zu Ihrem Passwort hinzufügen';

  @override
  String get lowcaseCheck => 'Kleinbuchstaben';

  @override
  String get lowcaseSubtitleCheck =>
      'Fügen Sie Kleinbuchstaben zu Ihrem Passwort hinzu';

  @override
  String get capitalLetCheck => 'Großbuchstaben';

  @override
  String get capitalLetSubtitleCheck =>
      'Fügen Sie Großbuchstaben zu Ihrem Passwort hinzu';

  @override
  String get symsCheck => 'Symbole';

  @override
  String get symsSubtitleCheck => 'Symbole zu Ihrem Passwort hinzufügen';

  @override
  String get passwordLabelText => 'Passwort';

  @override
  String get genButton => 'Passwort Generieren';

  @override
  String get copyButtonTooltip => 'Passwort Kopieren';

  @override
  String get copySnackBarMessage => 'Kopiert.';

  @override
  String get settingsAppBarTitle => 'Einstellungen';

  @override
  String get symsUsedLabelText => 'Verwendete Symbole';

  @override
  String get symsUsedRestoreButtonTooltip =>
      'Wiederherstellen der Standardeinstellungen';

  @override
  String get license => 'Lizenz';

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get copylinkbutton => 'Link kopieren';

  @override
  String get helpWithTranslationInfoButtonTooltip =>
      'Helping with translation would be a huge slay.';
}
