// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get numsCheck => 'Números';

  @override
  String get numsSubtitleCheck => 'Añade Números a tu contraseña';

  @override
  String get lowcaseCheck => 'Letras Minúsculas';

  @override
  String get lowcaseSubtitleCheck => 'Añade Letras Minúsculas a tu contraseña';

  @override
  String get capitalLetCheck => 'Letras Mayúsculas';

  @override
  String get capitalLetSubtitleCheck => 'Añade Mayúsculas a tu contraseña';

  @override
  String get symsCheck => 'Símbolos';

  @override
  String get symsSubtitleCheck => 'Añade Símbolos a tu contraseña';

  @override
  String get passwordLabelText => 'Contraseña';

  @override
  String get genButton => 'Generar Contraseña';

  @override
  String get copyButtonTooltip => 'Copiar al Portapapeles';

  @override
  String get copySnackBarMessage => 'Copiar al Portapapeles';

  @override
  String get settingsAppBarTitle => 'Opciones';

  @override
  String get symsUsedLabelText => 'Símbolos usados';

  @override
  String get symsUsedRestoreButtonTooltip => 'Restaurar por defecto';

  @override
  String get license => 'Licencia';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get copylinkbutton => 'Copiar enlace';

  @override
  String get helpWithTranslationInfoButtonTooltip =>
      'Ayudar con la traducción sería una gran slay.';
}
