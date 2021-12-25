import 'dart:math';

import 'package:get/get.dart';

const guidelineBaseWidth = 414;
const guidelineBaseHeight = 896;

double get screenWidth => Get.width;

double get screenHeight => Get.height;

double get scaleWidth => screenWidth / guidelineBaseWidth;

double get scaleHeight => screenHeight / guidelineBaseHeight;

double get scaleText => min(scaleWidth, scaleHeight);

extension ScreenExtension on num {
  double get w => this * scaleWidth; // Width Scale
  double get h => this * scaleHeight; // Height Scale
  double get t => this * scaleText; // Text Scale
  double get r => this * scaleText; // Radius Scale
}
