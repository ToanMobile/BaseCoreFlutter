import 'dart:math';

import 'package:get/get.dart';

const guidelineBaseWidth = 375;
const guidelineBaseHeight = 812;

double get screenWidth => Get.width;

double get screenHeight => Get.height;

double get scaleWidth => screenWidth / guidelineBaseWidth;

double get scaleHeight => screenHeight / guidelineBaseHeight;

double get scaleText => min(scaleWidth, scaleHeight);

extension ScreenExtension on num {
  double get w => this * scaleWidth; // Width Scale
  double get h => this * scaleHeight; // Height Scale
  double get sp => this * 1.0; //this * scaleText; // Text Scale
  double get r => this * scaleText; // Radius Scale
  double get sh => this * screenHeight; // Height %
  double get wh => this * screenWidth; // Width %
}
