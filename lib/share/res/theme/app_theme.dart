import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/fonts.gen.dart';
import '../colors_core.dart';
import 'text_theme.dart';

enum AppTheme { LIGHT, DARK }

final appThemeData = {
  AppTheme.LIGHT: ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    backgroundColor: whiteColor,
    primaryColorLight: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    bottomAppBarColor: whiteColor,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: createTextTheme(),
    fontFamily: FontFamily.mulish,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
  ),
  AppTheme.DARK: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: whiteColor,
    bottomAppBarColor: whiteColor,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: createTextTheme(),
    fontFamily: FontFamily.mulish,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
  ),
};
