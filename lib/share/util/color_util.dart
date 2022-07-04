import 'package:flutter/material.dart';

const String kCompleteValidHexPattern = r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$';

extension ColorUtils on Color {
  HSLColor get hsl => HSLColor.fromColor(this);
}

Color convertStringToHex(String? hex) {
  return Color(int.tryParse(hex!.replaceFirst('#', '0xFF')) ?? 0);
}

Color convertHSLToHex(num? h, num? s, num? l) {
  if (h == null || s == null || l == null) return Colors.black;
  final color = HSLColor.fromAHSL(1, h.toDouble(), s / 100, l / 100).toColor();
  // Logger.e('convertHSLToHex:color:'+ color.toString());
  // Logger.e('convertHSLToHex:hsl:'+ color.hsl.toString());
  return color;
}

Color? colorFromHex(String inputString, {bool enableAlpha = true}) {
  // Registers validator for exactly 6 or 8 digits long HEX (with optional #).
  final RegExp hexValidator = RegExp(kCompleteValidHexPattern);
  // Validating input, if it does not match — it's not proper HEX.
  if (!hexValidator.hasMatch(inputString)) return null;
  // Remove optional hash if exists and convert HEX to UPPER CASE.
  String hexToParse = inputString.replaceFirst('#', '').toUpperCase();
  // It may allow HEXs with transparency information even if alpha is disabled,
  if (!enableAlpha && hexToParse.length == 8) {
    // but it will replace this info with 100% non-transparent value (FF).
    hexToParse = 'FF${hexToParse.substring(2)}';
  }
  // HEX may be provided in 3-digits format, let's just duplicate each letter.
  if (hexToParse.length == 3) {
    hexToParse = hexToParse.split('').expand((i) => [i * 2]).join();
  }
  // We will need 8 digits to parse the color, let's add missing digits.
  if (hexToParse.length == 6) hexToParse = 'FF$hexToParse';
  // HEX must be valid now, but as a precaution, it will just "try" to parse it.
  final intColorValue = int.tryParse(hexToParse, radix: 16);
  // If for some reason HEX is not valid — abort the operation, return nothing.
  if (intColorValue == null) return null;
  // Register output color for the last step.
  final color = Color(intColorValue);
  // Decide to return color with transparency information or not.
  return enableAlpha ? color : color.withAlpha(255);
}
