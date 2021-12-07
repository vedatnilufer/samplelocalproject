import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/product/localization/locale_keys.dart';
import 'product/cache/cache_manager.dart';
import 'product/constants/hive/hive_constants.dart';
import 'product/constants/route/application_route_constants.dart';
import 'product/constants/theme/base_theme.dart';
import 'product/localization/application_localizations.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(StorageKeys.localStorage);
  await Hive.openBox(StorageKeys.langStorage);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? control;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    control = await LocalStorage.instance.getItem(StorageKeys.currenKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        ApplicationLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale!.languageCode && supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
      themeMode: ThemeMode.system,
      theme: IThemeData.instance.lightData(context),
      darkTheme: IThemeData.instance.darkData(context),
      initialRoute: control != null ? ApplicationRoute.rootApp : ApplicationRoute.splashView,
      routes: ApplicationRoute.instance.routesWidget,
    );
  }
}
