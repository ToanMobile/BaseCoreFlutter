import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../colors_core.dart';
import '../dimens.dart';
import 'theme_service.dart';

const fontApp = TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.w400);

TextStyle get text10 => fontApp.copyWith(fontSize: 10.sp);

TextStyle get text12 => fontApp.copyWith(fontSize: 12.sp);

TextStyle get text14 => fontApp.copyWith(fontSize: 14.sp);

TextStyle get text15 => fontApp.copyWith(fontSize: 15.sp);

TextStyle get text16 => fontApp.copyWith(fontSize: 16.sp);

TextStyle get text18 => fontApp.copyWith(fontSize: 18.sp);

TextStyle get text20 => fontApp.copyWith(fontSize: 20.sp);

TextStyle get text24 => fontApp.copyWith(fontSize: 24.sp);

TextStyle get text26 => fontApp.copyWith(fontSize: 26.sp);

TextStyle get text28 => fontApp.copyWith(fontSize: 28.sp);

TextStyle get text30 => fontApp.copyWith(fontSize: 30.sp);

TextStyle get text34 => fontApp.copyWith(fontSize: 34.sp);

extension TextStyleExt on TextStyle {
  //Decoration style
  TextStyle get none => copyWith(decoration: TextDecoration.none);

  TextStyle get underLine => copyWith(decoration: TextDecoration.underline);

  TextStyle get overLine => copyWith(decoration: TextDecoration.overline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get thickNess2 => copyWith(decorationThickness: 2);

  TextStyle get decorationBlack => copyWith(decorationColor: getColor().textThemeBlackColor);

  //Weight style
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

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

  TextStyle get textRedColor => copyWith(color: getColor().textThemeRedColor);

  TextStyle get textWhiteColor => copyWith(color: getColor().textThemeWhiteColor);

  TextStyle get textBrownColor => copyWith(color: getColor().themeBrownColor);

  TextStyle get textBlueColor => copyWith(color: getColor().themeBlueColor);

  TextStyle get textGreyColor => copyWith(color: getColor().themeGrayColor);

  TextStyle get textGrey2Color => copyWith(color: getColor().themeGray2Color);

  TextStyle get textErrorColor => copyWith(color: getColor().error);
}

TextTheme createTextTheme() => TextTheme(
      subtitle1: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.normal, fontSize: 14.sp),
      subtitle2: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.bold, fontSize: 14.sp),
      caption: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.normal, fontSize: 12.sp),
      bodyText1: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.w400, fontSize: 16.sp),
      bodyText2: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.w400, fontSize: 16.sp),
      headline6: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.normal, fontSize: 22.sp),
      headline5: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.bold, fontSize: 24.sp),
      headline4: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.bold, fontSize: 16.sp),
      headline3: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.w600, fontSize: 18.sp),
      headline2: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.w600, fontSize: 22.sp),
      headline1: TextStyle(fontFamily: FontFamily.mulish, fontWeight: FontWeight.bold, fontSize: 34.sp),
    );

TextTheme createPrimaryTextTheme() => createTextTheme().apply(bodyColor: whiteColor);

TextTheme createAccentTextTheme() => createTextTheme().apply(bodyColor: whiteColor);

TextTheme textTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

TextTheme primaryTextTheme(BuildContext context) {
  return Theme.of(context).primaryTextTheme;
}
