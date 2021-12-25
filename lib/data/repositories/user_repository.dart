import 'dart:async';

import 'package:core/controllers/app_controller.dart';
import 'package:core/data/api/models/request/enums.dart';
import 'package:core/data/api/models/request/profile_request.dart';
import 'package:core/data/api/models/response/api_response.dart';
import 'package:core/data/api/models/response/token_response.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:core/data/api/rest_client.dart';
import 'package:core/data/api/services/user_service.dart';
import 'package:core/data/storage/app_storage.dart';
import 'package:get/get.dart';

import 'base_repository.dart';

class UserRepository extends BaseRepository {
  final _userService = Get.find<UserService>();
  final storage = Get.find<AppStorage>();
  TokenResponse? tokenResponse;

  Future<String> uploadAvatar(String imagePath, {UploadDirName? uploadDir, int retries = 2}) async {
    ApiResponse? repository;
    try {
      repository = await _userService.uploadAvatar(imagePath, uploadDir: uploadDir);
    } catch (e) {
      if (retries > 0) {
        retries--;
        repository = await _userService.uploadAvatar(imagePath, uploadDir: uploadDir);
      }
    }
    return repository?.message['data'] ?? '';
  }

  Future<UserInfo> updateProfile(ProfileRequest profileRequest) async {
    final response = await _userService.updateProfile(profileRequest);
    return response;
  }

  Future<UserInfo> getProfile() async {
    final response = await _userService.getProfile();
    return response;
  }

  Future<void> logOut() => _userService.logOut();

  Future<UserInfo?> loginByEmail(String email, String password) async {
    final response = await _userService.loginByEmail(email, password);
    tokenResponse = response;
    if (response.data != null) {
      if (response.data?.isVerifiedEmail == true) {
        saveToken(response);
        return null;
      }
    }
    return response.data;
  }

  Future<UserInfo?> register(String username, String email, String password, String gender, num birthday) async {
    final response = await _userService.register(username, email, password, gender, birthday);
    tokenResponse = response;
    return response.data;
  }

  Future<bool> verifyCode(String email, String code) async {
    final isVerify = await _userService.verifyEmail(email, code);
    if (isVerify.statusCode == 200 && tokenResponse != null) {
      saveToken(tokenResponse!);
    }
    return isVerify.statusCode == 200;
  }

  Future<UserInfo?> resentCode(String email) async {
    final response = await _userService.resentCode(email);
    return response;
  }

  Future<bool> forgotPassword(String email) async {
    final isVerify = await _userService.forgotPassword(email);
    if (isVerify.statusCode == 200 && tokenResponse != null) {
      saveToken(tokenResponse!);
    }
    return isVerify.statusCode == 200;
  }

  Future<bool> resetPassword(String email, String code, String password) async {
    final isVerify = await _userService.resetPassword(email, code, password);
    if (isVerify.statusCode == 200 && tokenResponse != null) {
      saveToken(tokenResponse!);
    }
    return isVerify.statusCode == 200;
  }

  Future<UserInfo?> getMe({required String userId}) async {
    UserInfo userInfo = UserInfo(); //await _userService.getMe(userId);
    await storage.saveUserInfo(userInfo);
    Get.find<AppController>().updateUserInfo(userInfo);
    return userInfo;
  }

  Future<void> saveToken(TokenResponse token) async {
    RestClient.instance.setToken(token.accessToken!);
    await storage.saveUserInfo(token.data!);
    await storage.saveUserAccessToken(token.accessToken!);
    await storage.saveRefreshToken(token.refreshToken!);
  }

  Future<String?> getRefreshToken() async {
    return await storage.getRefreshToken();
  }

  Future<UserInfo?> getMyUserInfo() async {
    return await storage.getUserInfo();
  }

  Future<void> saveMyUserInfo(UserInfo userInfo) async {
    return await storage.saveUserInfo(userInfo);
  }
}
