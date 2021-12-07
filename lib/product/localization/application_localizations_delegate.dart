import 'package:flutter/material.dart';
import 'application_localizations.dart';

class ApplicationLocalizationsDelegate extends LocalizationsDelegate<ApplicationLocalizations> {
  const ApplicationLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['tr', 'en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    ApplicationLocalizations localizations = ApplicationLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(ApplicationLocalizationsDelegate old) => false;
}
