import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors_core.dart';
import 'text_theme.dart';

enum AppTheme { LIGHT, DARK }

final appThemeData = {
  AppTheme.LIGHT: ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    accentColor: accentColor,
    backgroundColor: whiteColor,
    primaryColorLight: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    bottomAppBarColor: whiteColor,
    primaryColorBrightness: Brightness.light,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: createTextTheme(),
    fontFamily: FontFamily,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent, // status bar color
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  ),
  AppTheme.DARK: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    primaryColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: whiteColor,
    bottomAppBarColor: whiteColor,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: createTextTheme(),
    fontFamily: FontFamily,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent, // status bar color
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  ),
};
