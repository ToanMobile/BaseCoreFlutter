import '../base_entity.dart';

class AuthEntity extends BaseEntity {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  @override
  String toString() {
    return 'AuthEntity{accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn}';
  }

  AuthEntity({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'expiresIn': expiresIn,
      'tokenType': tokenType,
      'refreshToken': refreshToken,
      'accessToken': accessToken,
    };
  }
}
