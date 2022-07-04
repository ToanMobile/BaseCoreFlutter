import 'dart:async';

import '../../../data/storage/app_storage.dart';
import '../../api/models/response/login/auth_entity.dart';
import '../api_constants.dart';
import '../models/response/login/user_entity.dart';
import 'base_service.dart';
import 'fcm_service.dart';

class UserService extends BaseService {
  Future<AuthEntity> loginByUser(String user, String password, AppStorage storage) async {
    FCMService fcmService = FCMService();
    String? fcmToken = await fcmService.getTokenDevice(storage);
    final queryParams = {
      'username': user,
      'password': password,
      'fcmToken': fcmToken,
      'grant_type': 'password',
      'rememberMe': true,
    };
    final response = await post(LOGIN, data: queryParams, responseType: JsonType.FULL_RESPONSE);
    return AuthEntity.fromJson(response);
  }

  Future<UserEntity> register(String username, String email, String password, String gender, num birthday) async {
    final queryParams = {
      'firstName': username,
      'email': email,
      'password': password,
      'gender': gender,
      'birthday': birthday,
      'numberOfStores': 0,
    };
    final response = await post(REGISTER, data: queryParams, responseType: JsonType.FULL_RESPONSE);
    return UserEntity.fromJson(response);
  }

  Future<void> logOut() => post(LOG_OUT, data: {});

  Future<UserEntity> getProfile() async {
    final response = await get(GET_PROFILE, responseType: JsonType.FULL_RESPONSE);
    return UserEntity.fromJson(response);
  }
}
