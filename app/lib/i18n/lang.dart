import 'package:app/i18n/files/ar.dart';
import 'package:app/i18n/files/en.dart';
import 'package:app/i18n/files/fr.dart';

dynamic langs = {
  "en": en,
  "fr": fr,
  "ar": ar,
};

List<Map<String, dynamic>> allLangs = [
  {'name': "English", 'name-en': "English", 'code': "en", 'direction': "ltr"},
  {'name': "Français", 'name-en': "French", 'code': "fr", 'direction': "ltr"},
  {'name': "العربية", 'name-en': "Arabic", 'code': "ar", 'direction': "rtl"},
];
