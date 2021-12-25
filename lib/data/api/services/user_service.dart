import 'dart:async';
import 'dart:convert';

import 'package:core/data/api/models/request/enums.dart';
import 'package:core/data/api/models/request/profile_request.dart';
import 'package:core/data/api/models/response/api_response.dart';
import 'package:core/data/api/models/response/token_response.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import 'base_service.dart';

class UserService extends BaseService {
  Future<TokenResponse> loginByEmail(String email, String password) async {
    final params = {"email": email, "password": password};
    final response = await post(LOGIN, data: params, responseType: JsonType.FULL_RESPONSE);
    return TokenResponse.fromJson(response);
  }

  Future<TokenResponse> register(String username, String email, String password, String gender, num birthday) async {
    final params = {"firstName": username, "email": email, "password": password, "gender": gender, "birthday": birthday, "numberOfStores": 0};
    final response = await post(REGISTER, data: params, responseType: JsonType.FULL_RESPONSE);
    return TokenResponse.fromJson(response);
  }

  Future<UserInfo> resentCode(String email) async {
    final params = {"email": email};
    final response = await post(RESENT_CODE, data: params, responseType: JsonType.FULL_RESPONSE);
    return UserInfo.fromJson(response.data);
  }

  Future<ApiResponse> verifyEmail(String email, String code) async {
    final params = {"email": email, "code": code};
    final response = await post(VERIFY_EMAIL, data: params, responseType: JsonType.STRING_RESPONSE);
    return response;
  }

  Future<ApiResponse> forgotPassword(String email) async {
    final params = {"email": email};
    final response = await post(FORTGOT_PASSWORD, data: params, responseType: JsonType.STRING_RESPONSE);
    return response;
  }

  Future<ApiResponse> resetPassword(String email, String code, String newPassword) async {
    final params = {"email": email, "code": code, "newPassword": newPassword, "lastName": "string"};
    final response = await post(RESET_PASSWORD, data: params, responseType: JsonType.STRING_RESPONSE);
    return response;
  }

  Future<void> logOut() => post(LOG_OUT, data: {});

  Future<UserInfo> loginFacebook(String token) async {
    final response = await post(sprintf(LOGIN_FACEBOOK, [token]));
    return UserInfo.fromJson(response.data);
  }

  Future<UserInfo> loginGoogle(String token) async {
    final response = await post(sprintf(LOGIN_GOOGLE, [token]));
    return UserInfo.fromJson(response.data);
  }

  Future<UserInfo> getProfile() async {
    final response = await get(EDIT_PROFILE, responseType: JsonType.FULL_RESPONSE);
    return UserInfo.fromJson(response);
  }

  Future<ApiResponse> uploadAvatar(String? imagePath, {UploadDirName? uploadDir}) async {
    Map<String, dynamic> data = {};
    if (imagePath != null) {
      data["image"] = await MultipartFile.fromFile(imagePath, filename: basename(imagePath), contentType: MediaType.parse("image/jpeg"));
    }
    var response = await postUpload(sprintf(UPLOAD_AVATAR, [uploadDir?.name ?? ""]), data: FormData.fromMap(data), responseType: JsonType.STRING_RESPONSE);
    return response;
  }

  Future<UserInfo> updateProfile(ProfileRequest profileRequest) async {
    final postData = jsonEncode(profileRequest.toJson());
    final response = await put(EDIT_PROFILE, data: postData, responseType: JsonType.FULL_RESPONSE);
    return UserInfo.fromJson(response);
  }
}
