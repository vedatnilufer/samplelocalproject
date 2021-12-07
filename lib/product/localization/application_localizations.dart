import 'dart:async';
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:samplelocalproject/product/constants/images/assets_path_constants.dart';
import 'application_localizations_delegate.dart';

class ApplicationLocalizations {
  late final Locale appLocale;

  ApplicationLocalizations(this.appLocale);

  static ApplicationLocalizations? of(BuildContext context) {
    return Localizations.of<ApplicationLocalizations>(context, ApplicationLocalizations);
  }

  static const LocalizationsDelegate<ApplicationLocalizations> delegate = ApplicationLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    Map<String, dynamic>? jsonLanguageMap = await getTranslates(appLocale.languageCode);
    _localizedStrings = jsonLanguageMap!.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String jsonkey) {
    return _localizedStrings[jsonkey];
  }

  List<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
    ApplicationLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  Locale? localeResolutionCallback(locale, supportedLocales) {
    for (var supportedLocaleLanguage in supportedLocales) {
      if (supportedLocaleLanguage.languageCode == locale!.languageCode && supportedLocaleLanguage.countryCode == locale.countryCode) {
        return supportedLocaleLanguage;
      }
    }
    return supportedLocales.first;
  }
}

getTranslate(BuildContext context, String text) => ApplicationLocalizations.of(context)!.translate(text);

Future<Map<String, dynamic>?> getTranslates(String langCode) async {
  Map<String, dynamic> defaultMap = <String, dynamic>{};
  try {
    var storage = Hive.box(StorageKeys.langStorage);
    await storage.clear();
    var localTranslates = await storage.get(StorageKeys.langStorage + langCode.toUpperCase());
    var response = await rootBundle.loadString(AssetsPath.instance.langAsset(langCode));

    if (json.decode(response) != null) {
      var rValue = (json.decode(response)).fold(defaultMap, (t, e) {
        t[e['key']] = e['value'];
        return t;
      });
      await storage.put(StorageKeys.langStorage + langCode.toUpperCase(), rValue);
      return rValue;
    }
    return localTranslates;
  } catch (e) {
    return defaultMap;
  }
}
