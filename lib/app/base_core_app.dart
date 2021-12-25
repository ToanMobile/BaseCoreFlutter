import 'package:core/app/app_pages.dart';
import 'package:core/controllers/app_controller.dart';
import 'package:core/res/languages/localization_service.dart';
import 'package:core/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class BaseCoreApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Obx(
        () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "app.name".text,
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
            Locale('en', 'US'), // English
            Locale('vi', 'VN'), // VietNam
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
        return AppRoutes.SPLASH;
      case AuthState.authorized:
        return AppRoutes.SPLASH;
      case AuthState.new_install:
        return AppRoutes.LOGIN;
      case AuthState.uncompleted:
        return AppRoutes.LOGIN;
      default:
        return AppRoutes.SPLASH;
    }
  }
}
