import 'package:flutter/material.dart';

import '../../../res/style.dart';
import '../icon_component.dart';

@immutable
class CTextFormField extends StatelessWidget {
  const CTextFormField(
      {Key? key,
      this.controller,
      this.validator,
      this.onChange,
      this.labelText,
      this.hintLabel,
      this.decoration,
      this.maxLines = 1,
      this.obscureText = false,
      this.isEditEnable = true,
      this.isNotEnable,
      this.marginVertical,
      this.marginHorizontal,
      this.height = 56,
      this.suffixIcon,
      this.textLabelStyle,
      this.textStyle,
      this.textInputType})
      : super(key: key);

  final TextStyle? textLabelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChange;
  final String? labelText;
  final String? hintLabel;
  final double? height;
  final bool obscureText;
  final bool isEditEnable;
  final int? maxLines;
  final double? marginVertical;
  final double? marginHorizontal;
  final Color? isNotEnable;
  final MyIcons? suffixIcon;
  final InputDecoration? decoration;
  final TextInputType? textInputType;
  static const double borderWidth = 1;
  static const double borderRadius = 8.0;
  static const filled = true;

  InputDecoration fieldDecoration(ctx) {
    return InputDecoration(
      enabled: isEditEnable,
      labelText: labelText,
      labelStyle: textLabelStyle ?? Theme.of(ctx).inputDecorationTheme.labelStyle,
      hintText: hintLabel,
      hintStyle: Theme.of(ctx).inputDecorationTheme.hintStyle,
      filled: filled,
      fillColor: isEditEnable ? decoration?.fillColor ?? Theme.of(ctx).colorScheme.background : (isNotEnable ?? greyBorderColor),
      focusedBorder: decoration?.focusedBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: Theme.of(ctx).disabledColor,
            ),
          ),
      errorBorder: decoration?.errorBorder ??
          const OutlineInputBorder(
            borderSide: BorderSide(width: borderWidth),
          ),
      focusedErrorBorder: decoration?.errorBorder ??
          const OutlineInputBorder(
            borderSide: BorderSide(width: borderWidth),
          ),
      enabledBorder: decoration?.enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: borderWidth,
              color: Theme.of(ctx).disabledColor,
            ),
          ),
      contentPadding: EdgeInsets.symmetric(vertical: marginVertical ?? 10.0, horizontal: marginHorizontal ?? 10.0),
      suffixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 10.0),
        child: suffixIcon, // myIcon is a 48px-wide widget.
      ),
      suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 10, vertical: marginVertical ?? 10),
      child: TextFormField(
        controller: controller,
        decoration: fieldDecoration(context),
        keyboardType: textInputType ?? TextInputType.text,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        validator: (val) {
          return validator!(val!);
        },
        onChanged: onChange,
        obscureText: obscureText,
        style: textStyle ?? Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
