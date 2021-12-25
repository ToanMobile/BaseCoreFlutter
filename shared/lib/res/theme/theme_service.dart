import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors_core.dart';
import 'app_theme.dart';

class ThemeService {
  static const LIGHT_THEME = 0;
  static const DARK_THEME = 1;
  ThemeData? _themeData;

  ThemeData? get themeData {
    _themeData ??= appThemeData[AppTheme.DARK];
    return _themeData;
  }

  init(dynamic store) async {
    loadTheme(store);
  }

  Future<void> loadTheme(dynamic store) async {
    final theme = await store.getTheme();
    currentAppTheme = getAppTheme(theme);
    _themeData = appThemeData[currentAppTheme];
  }

  updateTheme(dynamic store, int theme) async {
    currentAppTheme = getAppTheme(theme);
    _themeData = appThemeData[theme];
    store.setTheme(theme);
  }

  AppTheme getAppTheme(int theme) {
    switch (theme) {
      case LIGHT_THEME:
        return AppTheme.LIGHT;
      case DARK_THEME:
        return AppTheme.DARK;
      default:
        return AppTheme.LIGHT;
    }
  }
}

AppTheme currentAppTheme = AppTheme.LIGHT;

ColorScheme getColor() => Get.find<ThemeService>().themeData!.colorScheme;

extension MyColorScheme on ColorScheme {
  Color getColorTheme(Color colorThemeWhite, Color colorThemeDark) {
    switch (currentAppTheme) {
      case AppTheme.LIGHT:
        return colorThemeWhite;
      case AppTheme.DARK:
        return colorThemeDark;
      default:
        return colorThemeWhite;
    }
  }

  //***************************START TEXT COLOR*****************************************
  //Màu của chữ trong toàn bộ ứng dụng

  Color get textThemeBlackColor => getColorTheme(blackColor, whiteColor);

  Color get textThemeWhiteColor => getColorTheme(whiteColor, whiteColor);

  Color get textThemePrimaryColor => getColorTheme(themePrimaryColor, themePrimaryColor);

  Color get textThemeDartColor => getColorTheme(blackColor, blackColor);

  Color get textThemeBlack99Color => getColorTheme(black99Color, black99Color);

  //***************************COMPONENT COLOR*****************************************
  //Màu của các button,checkbox.....

  Color get themePrimaryColor => getColorTheme(primaryColor, primaryColor);

  Color get themeWhiteColor => getColorTheme(whiteColor, black3dDColor);

  Color get themeBlackColor => getColorTheme(blackColor, blackColor);

  Color get themeBrownColor => getColorTheme(brownColor, brownColor);

  Color get themeBlueColor => getColorTheme(blueColor, blueColor);

  Color get themeGrayColor => getColorTheme(greyColor, greyColor);

  Color get colorPrimaryWhite => getColorTheme(primaryColor, whiteColor);

  Color get themeShadowColor => getColorTheme(shadowColor, shadowColor);

  Color get colorShimmer => getColorTheme(Colors.white24, Colors.white24);

  //***************************BACKGROUND COLOR*****************************************
  //Màu của tất cả các background

  Color get backgroundWhiteBlackColor => getColorTheme(whiteColor, black3dDColor);
}
