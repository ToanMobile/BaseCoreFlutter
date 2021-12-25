import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../colors_core.dart';
import '../dimens.dart';
import 'theme_service.dart';

const FontFamily = "Rubik";

const fontApp = TextStyle(
  fontFamily: FontFamily,
  fontWeight: FontWeight.w400
);

TextStyle get text10 => fontApp.copyWith(fontSize: 10.t);

TextStyle get text12 => fontApp.copyWith(fontSize: 12.t);

TextStyle get text14 => fontApp.copyWith(fontSize: 14.t);

TextStyle get text15 => fontApp.copyWith(fontSize: 15.t);

TextStyle get text16 => fontApp.copyWith(fontSize: 16.t);

TextStyle get text18 => fontApp.copyWith(fontSize: 18.t);

TextStyle get text20 => fontApp.copyWith(fontSize: 20.t);

TextStyle get text24 => fontApp.copyWith(fontSize: 24.t);

TextStyle get text26 => fontApp.copyWith(fontSize: 26.t);

TextStyle get text28 => fontApp.copyWith(fontSize: 28.t);

TextStyle get text30 => fontApp.copyWith(fontSize: 30.t);

TextStyle get text34 => fontApp.copyWith(fontSize: 34.t);

extension TextStyleExt on TextStyle {
  //Decoration style
  TextStyle get none => copyWith(decoration: TextDecoration.none);

  TextStyle get underLine => copyWith(decoration: TextDecoration.underline);

  TextStyle get overLine => copyWith(decoration: TextDecoration.overline);

  TextStyle get thickNess2 => copyWith(decorationThickness: 2);

  TextStyle get decorationBlack => copyWith(decorationColor: getColor().textThemeBlackColor);

  //Weight style
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  //height style
  TextStyle get height16Per => copyWith(height: 1.6);

  TextStyle get height17Per => copyWith(height: 1.7);

  TextStyle get height18Per => copyWith(height: 1.8);

  TextStyle get height19Per => copyWith(height: 1.9);

  TextStyle get height20Per => copyWith(height: 2.0);

  TextStyle get height21Per => copyWith(height: 2.1);

  TextStyle get height22Per => copyWith(height: 2.2);

  //Color style
  TextStyle get textBlackColor => copyWith(color: getColor().textThemeBlackColor);

  TextStyle get textPrimaryColor => copyWith(color: getColor().textThemePrimaryColor);

  TextStyle get textDartColor => copyWith(color: getColor().textThemeDartColor);

  TextStyle get textWhiteColor => copyWith(color: getColor().textThemeWhiteColor);

  TextStyle get textBrownColor => copyWith(color: getColor().themeBrownColor);

  TextStyle get textBlueColor => copyWith(color: getColor().themeBlueColor);

  TextStyle get textGreyColor => copyWith(color: getColor().themeGrayColor);

  TextStyle get textErrorColor => copyWith(color: getColor().error);
}

TextTheme createTextTheme() => TextTheme(
    subtitle1: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.normal, fontSize: 14.t),
    subtitle2: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.bold, fontSize: 14.t),
    caption: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.normal, fontSize: 12.t),
    bodyText1: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.normal, fontSize: 16.t),
    bodyText2: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.bold, fontSize: 16.t),
    headline6: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.normal, fontSize: 22.t),
    headline5: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.bold, fontSize: 24.t),
    headline4: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.bold, fontSize: 16.t),
    headline3: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.w600, fontSize: 18.t),
    headline2: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.w600, fontSize: 22.t),
    headline1: TextStyle(fontFamily: FontFamily, fontWeight: FontWeight.bold, fontSize: 34.t));

TextTheme createPrimaryTextTheme() => createTextTheme().apply(bodyColor: whiteColor);

TextTheme createAccentTextTheme() => createTextTheme().apply(bodyColor: whiteColor);

TextTheme textTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

TextTheme primaryTextTheme(BuildContext context) {
  return Theme.of(context).primaryTextTheme;
}

extension TextExtension on String {
  String get text => tr;
}
