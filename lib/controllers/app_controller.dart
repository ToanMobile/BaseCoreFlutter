import 'package:core/app/app_pages.dart';
import 'package:core/app/base_app_config.dart';
import 'package:core/data/api/api_constants.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:core/data/api/rest_client.dart';
import 'package:core/data/storage/app_storage.dart';
import 'package:core/res/languages/localization_service.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/libraries/logger/flutter_logger.dart';
import 'package:shared/libraries/photo_manager/photo_provider.dart';
import 'package:shared/res/theme/app_theme.dart';

class AppController extends GetxController {
  Environment? env;
  Rx<Locale?>? locale;
  Rx<ThemeData?>? themeData;
  Rx<AuthState> authState = AuthState.unauthorized.obs;
  UserInfo? user; //Su dung kiem tra khi login,logout

  init(Environment environment) async {
    env = environment;
    initLogger(environment);
    await Future.wait([initFirebase(), initStorage()]);
    final storage = Get.find<AppStorage>();
    await setupLocator();
    await initTheme(storage);
    await initLanguage();
    await initAuth(storage);
    initPhotos();
  }

  void initLogger(Environment environment) {
    Logger.init(
      environment == Environment.dev,
      isShowFile: true,
      isShowTime: false,
      isShowNavigation: true,
    );
  }

  Future<void> initAuth(AppStorage storage) async {
    user = await storage.getUserInfo();
    String? accessToken = await storage.getUserAccessToken();
    await initApi(accessToken);
    if (accessToken != null && accessToken.isNotEmpty && user != null) {
      //await Get.find<UserRepository>().getMe(userId: user?.id ?? "");
      Logger.d("accessToken:" + user.toString() + "user:" + (user?.id.toString() ?? ""));
      authState.value = user?.id == null ? AuthState.uncompleted : AuthState.authorized;
    } else {
      authState.value = AuthState.unauthorized;
    }
  }

  Future<void> loginOrLogoutSuccess({UserInfo? mUser}) async {
    if (user != null) user = mUser;
    if (user != null) {
      //Case login
      /* if (user!.isUpdateProfile) {
        //Get.offAllNamed(AppRoutes.UPDATE_PROFILE);
      } else {
        if (user == null) {
          await Get.find<UserRepository>().getMe(userId: user!.id!);
        }
        //Get.offAllNamed(user!.isDoctor ? AppRoutes.MAIN_DOCTOR : AppRoutes.MAIN);
      }*/
    } else {
      //Case logout
      Get.offAllNamed(AppRoutes.SPLASH);
    }
  }

  Future<void> initFirebase() async {
    //Init Firebase
    //await Firebase.initializeApp();
  }

  Future<void> initStorage() async {
    await Get.put(AppStorage()).init();
  }

  Future<void> initPhotos() async {
    Get.put(PhotoProvider()).init();
  }

  bool checkAuth() {
    return user?.id != null;
  }

  //Thong tin quan ly user khi login,lien ket sdk netalo
  updateUserInfo(UserInfo? user) {
    this.user = user;
  }

  logout() async {
    user = null;
    locale = null;
    themeData = null;
    await Get.find<AppStorage>().logout();
    loginOrLogoutSuccess();
  }

  Future<void> initTheme(AppStorage storage) async {
    await Get.put(ThemeService()).init(storage);
    final themeService = Get.find<ThemeService>();
    themeData = themeService.themeData.obs;
    //Lang nghe su thay doi theme khi luu vao storage
    storage.box.listenKey(AppStorage.APP_THEME, (value) {
      if (value != null && themeData != null) {
        themeData!.value = appThemeData[themeService.getAppTheme(value)];
      } else {
        themeData = appThemeData[themeService.getAppTheme(value)].obs;
      }
    });
  }

  Future<void> initLanguage() async {
    await Get.put(LocalizationService()).init();
    final localeService = Get.find<LocalizationService>();
    locale = localeService.getLocale.obs;
    //Lang nghe su thay doi theme khi luu vao storage
    localeService.store.box.listenKey(AppStorage.APP_LANGUAGE, (value) {
      if (value != null) locale!.value = Locale(value);
    });
  }

  initApi(String? accessToken) async {
    String baseUrl;
    // init api
    switch (env!) {
      case Environment.prod:
        baseUrl = BASE_URL_PROD;
        UPLOAD_PHOTO_URL = UPLOAD_PHOTO_URL_PROD;
        PHOTO_URL = BASE_URL_PHOTO_PRO;
        break;
      case Environment.dev:
        baseUrl = BASE_URL_DEV;
        UPLOAD_PHOTO_URL = UPLOAD_PHOTO_URL_DEV;
        PHOTO_URL = BASE_URL_PHOTO_DEV;
        break;
    }
    RestClient.instance.init(baseUrl, accessToken: accessToken ?? "");
  }

  @override
  void onClose() {
    // Close all service
    Get.reset();
    super.onClose();
  }
}

enum AuthState { unauthorized, authorized, uncompleted, new_install }
