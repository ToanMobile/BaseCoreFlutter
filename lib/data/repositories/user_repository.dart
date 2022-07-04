import 'dart:async';

import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import '../../data/api/models/request/enums.dart';
import '../../data/api/models/response/api_response.dart';
import '../../data/api/models/response/login/auth_entity.dart';
import '../../data/api/models/response/login/user_entity.dart';
import '../../data/api/services/user_service.dart';
import '../../data/storage/app_storage.dart';
import '../api/rest_client.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  final _userService = Get.find<UserService>();
  final storage = Get.find<AppStorage>();

  Future<String> uploadAvatar(String imagePath, {UploadDirName? uploadDir, int retries = 2}) async {
    ApiResponse? repository;
    try {
      //repository = await _userService.uploadAvatar(imagePath, uploadDir: uploadDir);
    } catch (e) {
      if (retries > 0) {
        retries--;
        //repository = await _userService.uploadAvatar(imagePath, uploadDir: uploadDir);
      }
    }
    return repository?.message['data'] ?? '';
  }

  Future<UserEntity> getProfile() async {
    final response = await _userService.getProfile();
    return response;
  }

  Future<void> logOut() => _userService.logOut();

  Future<AuthEntity?> loginByUser(String email, String password) async {
    final response = await _userService.loginByUser(email, password, storage);
    await saveToken(response);
    return response;
  }

  Future<UserEntity?> register(String username, String email, String password, String gender, num birthday) async {
    final response = await _userService.register(username, email, password, gender, birthday);
    return response;
  }

  Future<UserEntity?> getMe() async {
    UserEntity userInfo = await _userService.getProfile();
    await storage.saveUserInfo(userInfo);
    Get.find<AppController>().updateUserInfo(userInfo);
    return userInfo;
  }

  Future<void> saveToken(AuthEntity? authEntity) async {
    if (authEntity == null || authEntity.accessToken == null) return;
    RestClient.instance.setToken(authEntity.accessToken!);
    await storage.saveToken(authEntity.accessToken!);
    await _userService.getProfile().then((value) => storage.saveUserInfo(value));
  }

  Future<String?> getRefreshToken() async {
    return await storage.getToken();
  }

  Future<UserEntity?> getMyUserInfo() async {
    return await storage.getUserInfo();
  }

  Future<void> saveMyUserInfo(UserEntity userInfo) async {
    return await storage.saveUserInfo(userInfo);
  }
}
