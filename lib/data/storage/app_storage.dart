import 'dart:convert';

import 'package:core/data/api/models/user_info.dart';
import 'package:core/res/languages/localization_service.dart';
import 'package:core/res/style.dart';
import 'package:get_storage/get_storage.dart';

class AppStorage {
  late GetStorage box;
  static const STORAGE_NAME = "BaseCore_storage";
  static const USER_ACCESS_TOKEN = "user_access_token";
  static const USER_REFRESH_TOKEN = "user_refresh_token";
  static const APP_USER_INFO = "app_user_info";
  static const APP_THEME = "app_theme";
  static const APP_LANGUAGE = "app_language";

  init() async {
    await GetStorage.init(STORAGE_NAME);
    box = GetStorage(STORAGE_NAME);
  }

  Future<void> saveUserAccessToken(String accessToken) async {
    box.write(USER_ACCESS_TOKEN, accessToken);
  }

  Future<String?> getUserAccessToken() async {
    final token = await box.read(USER_ACCESS_TOKEN);
    return token;
  }

  Future<void> saveUserInfo(UserInfo user) async {
    String json = jsonEncode(user.toJson());
    box.write(APP_USER_INFO, json);
  }

  Future<UserInfo?> getUserInfo() async {
    final userJson = await box.read(APP_USER_INFO);
    return userJson != null ? UserInfo.fromJson(json.decode(userJson)) : null;
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    box.write(USER_REFRESH_TOKEN, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final token = await box.read(USER_REFRESH_TOKEN);
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
    if (box.hasData(APP_LANGUAGE)) await box.remove(APP_LANGUAGE);
    if (box.hasData(APP_THEME)) await box.remove(APP_THEME);
    if (box.hasData(USER_REFRESH_TOKEN)) await box.remove(USER_REFRESH_TOKEN);
    if (box.hasData(APP_USER_INFO)) await box.remove(APP_USER_INFO);
    if (box.hasData(USER_ACCESS_TOKEN)) await box.remove(USER_ACCESS_TOKEN);
  }
}
