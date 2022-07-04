// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../data/api/models/response/login/user_entity.dart';
import '../../res/languages/localization_service.dart';
import '../../res/style.dart';
import '../../share/libraries/logger/flutter_logger.dart';

class AppStorage {
  late GetStorage box;
  static const STORAGE_NAME = "tradein_storage";
  static const FCM_TOKEN = "fcm_token";
  static const USER_TOKEN = "user_token";
  static const APP_USER_INFO = "app_user_info";
  static const APP_THEME = "app_theme";
  static const APP_LANGUAGE = "app_language";

  init() async {
    await GetStorage.init(STORAGE_NAME);
    box = GetStorage(STORAGE_NAME);
  }

  Future<void> saveFcmToken(String accessToken) async {
    box.write(FCM_TOKEN, accessToken);
  }

  Future<String?> getFcmToken() async {
    final token = await box.read(FCM_TOKEN);
    return token;
  }

  Future<void> saveUserInfo(UserEntity user) async {
    String json = jsonEncode(user.toJson());
    Logger.e('saveUserInfo::' + user.toString());
    box.write(APP_USER_INFO, json);
  }

  Future<UserEntity?> getUserInfo() async {
    final userJson = await box.read(APP_USER_INFO);
    return userJson != null ? UserEntity.fromJson(json.decode(userJson)) : null;
  }

  Future<void> saveToken(String refreshToken) async {
    box.write(USER_TOKEN, refreshToken);
  }

  Future<String?> getToken() async {
    final token = await box.read(USER_TOKEN);
    return token;
  }

  Future<void> setTheme(int theme) async {
    box.write(APP_THEME, theme);
  }

  Future<int> getTheme() async {
    final theme = await box.read(APP_THEME) ?? ThemeService.LIGHT_THEME;
    return theme;
  }

  Future<void> setLanguage(String language) async {
    box.write(APP_LANGUAGE, language);
  }

  Future<String> getLanguage() async {
    final theme = await box.read(APP_LANGUAGE) ?? LocalizationService.VI_VN;
    return theme;
  }

  Future<void> logout() async {
    print("USER_ACCESS_TOKEN::" + box.hasData(USER_TOKEN).toString());
    if (box.hasData(APP_LANGUAGE)) await box.remove(APP_LANGUAGE);
    if (box.hasData(APP_THEME)) await box.remove(APP_THEME);
    if (box.hasData(USER_TOKEN)) await box.remove(USER_TOKEN);
    if (box.hasData(APP_USER_INFO)) await box.remove(APP_USER_INFO);
    if (box.hasData(FCM_TOKEN)) await box.remove(FCM_TOKEN);
  }
}
