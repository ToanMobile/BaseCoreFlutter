import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomMenuController extends GetxController {
  final themeManager = Get.find<ThemeService>();
  Rx<ThemeData?>? theme;

  @override
  void onInit() {
    super.onInit();
    theme = themeManager.themeData.obs;
   /* themeManager.store.box.listenKey(AppStorage.APP_THEME, (value) {
      theme!.value = appThemeData[themeManager.getAppTheme(value)];
      update();
    });*/
  }
}
