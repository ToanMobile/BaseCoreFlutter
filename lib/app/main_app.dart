// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../app/app_pages.dart';
import '../controllers/app_controller.dart';
import '../res/languages/localization_service.dart';
import '../res/style.dart';

class TradeInApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Obx(
        () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          title: LocalString.appName,
          translations: LocalizationService(),
          locale: controller.locale?.value,
          theme: controller.themeData?.value,
          initialRoute: _getRoute(),
          getPages: AppPages.pages,
          defaultTransition: Transition.fadeIn,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('vi'), // VN
          ],
        ),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  String _getRoute() {
    switch (controller.authState.value) {
      case AuthState.unauthorized:
        return AppRoutes.HOME;
      case AuthState.authorized:
        return AppRoutes.HOME;
      case AuthState.new_install:
        return AppRoutes.HOME;
      case AuthState.uncompleted:
        return AppRoutes.HOME;
      default:
        return AppRoutes.HOME;
    }
  }
}
