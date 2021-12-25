import 'package:core/data/api/models/user_info.dart';

class TokenResponse {
  TokenResponse({
    String? accessToken,
    String? refreshToken,
    UserInfo? data,
    String? message,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _data = data;
    _message = message;
  }

  String? _accessToken;
  String? _refreshToken;
  UserInfo? _data;
  String? _message;

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  UserInfo? get data => _data;

  String? get message => _message;

  TokenResponse.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _data = json['data'] != null ? UserInfo.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

  @override
  String toString() {
    return 'TokenResponse{_accessToken: $_accessToken, _refreshToken: $_refreshToken, _data: $_data, _message: $_message}';
  }

}
