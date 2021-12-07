import 'package:flutter/material.dart';
import 'package:samplelocalproject/product/constants/color/color_constants.dart';

abstract class ITheme {
  ThemeData lightData(BuildContext context);
  ThemeData darkData(BuildContext context);
}

class IThemeData extends ITheme {
  static IThemeData? _instace;
  static IThemeData get instance {
    if (_instace != null) return _instace!;
    _instace = IThemeData._init();
    return _instace!;
  }

  IThemeData._init();

  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();
  @override
  ThemeData lightData(BuildContext context) => _lightTheme.copyWith(
        //   scaffoldBackgroundColor: ColorConstants.catSkillWhite,
        primaryColor: ColorConstants.java,
        errorColor: ColorConstants.sunsetOrange,
        appBarTheme: _lightTheme.appBarTheme.copyWith(
          backgroundColor: ColorConstants.catSkillWhite,
          textTheme: _lightTheme.textTheme.apply(bodyColor: ColorConstants.lynch),
        ),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          caption: TextStyle(color: ColorConstants.lynch),
        ),
        /*
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).copyWith(
          subtitle1: const TextStyle(color: Colors.black),
          caption: const TextStyle(color: ColorConstants.lynch),
        ),
         */
        bottomNavigationBarTheme: _lightTheme.bottomNavigationBarTheme.copyWith(
          selectedItemColor: ColorConstants.java,
          unselectedItemColor: ColorConstants.lynch,
          backgroundColor: ColorConstants.catSkillWhite,
        ),
        cardTheme: _lightTheme.cardTheme.copyWith(color: ColorConstants.catSkillWhite),
        colorScheme: _lightTheme.colorScheme.copyWith(
          primary: ColorConstants.bitterSweet,
          onPrimary: ColorConstants.lynch,
          onSecondary: ColorConstants.catSkillWhite,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: ColorConstants.java,
          unselectedLabelColor: ColorConstants.zambezi,
        ),
      );
  @override
  ThemeData darkData(BuildContext context) => _darkTheme.copyWith(
        primaryColor: ColorConstants.java,
      );
}
