/// followerCount : 0
/// pointCount : 0
/// loginAttemptCount : 0
/// isBanned : false
/// role : "customer"
/// isVerifiedEmail : true
/// _id : "615d95ddf1b53f001bcdb088"
/// firstName : "toan01"
/// email : "huynhvantoan.itc@gmail.com"
/// lastName : "string"
/// createdAt : "2021-10-06T12:26:05.457Z"
/// updatedAt : "2021-10-06T12:26:23.162Z"
/// __v : 0
/// verifyEmailExpire : null
/// verifyEmailToken : null

class UserInfo {
  UserInfo({
    int? followerCount,
    int? pointCount,
    int? loginAttemptCount,
    bool? isBanned,
    String? role,
    bool? isVerifiedEmail,
    String? id,
    String? firstName,
    String? email,
    String? lastName,
    String? createdAt,
    String? updatedAt,
    String? avatar,
    int? v,
    dynamic verifyEmailExpire,
    dynamic verifyEmailToken,
  }) {
    _followerCount = followerCount;
    _pointCount = pointCount;
    _loginAttemptCount = loginAttemptCount;
    _isBanned = isBanned;
    _role = role;
    _isVerifiedEmail = isVerifiedEmail;
    _id = id;
    _firstName = firstName;
    _email = email;
    _avatar = avatar;
    _lastName = lastName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _verifyEmailExpire = verifyEmailExpire;
    _verifyEmailToken = verifyEmailToken;
  }

  UserInfo.fromJson(dynamic json) {
    _followerCount = json['followerCount'];
    _pointCount = json['pointCount'];
    _loginAttemptCount = json['loginAttemptCount'];
    _isBanned = json['isBanned'];
    _role = json['role'];
    _isVerifiedEmail = json['isVerifiedEmail'];
    _id = json['_id'];
    _firstName = json['firstName'];
    _email = json['email'];
    _lastName = json['lastName'];
    _avatar = json['avatar'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _verifyEmailExpire = json['verifyEmailExpire'];
    _verifyEmailToken = json['verifyEmailToken'];
  }

  int? _followerCount;
  int? _pointCount;
  int? _loginAttemptCount;
  bool? _isBanned;
  String? _role;
  bool? _isVerifiedEmail;
  String? _id;
  String? _firstName;
  String? _email;
  String? _avatar;
  String? _lastName;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  dynamic _verifyEmailExpire;
  dynamic _verifyEmailToken;

  int? get followerCount => _followerCount;

  int? get pointCount => _pointCount;

  int? get loginAttemptCount => _loginAttemptCount;

  bool? get isBanned => _isBanned;

  String? get role => _role;

  bool? get isVerifiedEmail => _isVerifiedEmail;

  String? get id => _id;

  String? get firstName => _firstName;

  String? get email => _email;

  String? get avatar => _avatar;

  String? get lastName => _lastName;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get v => _v;

  dynamic get verifyEmailExpire => _verifyEmailExpire;

  dynamic get verifyEmailToken => _verifyEmailToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['followerCount'] = _followerCount;
    map['pointCount'] = _pointCount;
    map['loginAttemptCount'] = _loginAttemptCount;
    map['isBanned'] = _isBanned;
    map['role'] = _role;
    map['isVerifiedEmail'] = _isVerifiedEmail;
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['email'] = _email;
    map['avatar'] = _avatar;
    map['lastName'] = _lastName;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['verifyEmailExpire'] = _verifyEmailExpire;
    map['verifyEmailToken'] = _verifyEmailToken;
    return map;
  }

  String? get userName => '$firstName $lastName';

  @override
  String toString() {
    return 'UserInfo{_followerCount: $_followerCount, avatar: $_avatar, _loginAttemptCount: $_loginAttemptCount, _isBanned: $_isBanned, _role: $_role, _isVerifiedEmail: $_isVerifiedEmail, _id: $_id, _firstName: $_firstName, _email: $_email, _lastName: $_lastName, _createdAt: $_createdAt, _updatedAt: $_updatedAt, _v: $_v, _verifyEmailExpire: $_verifyEmailExpire, _verifyEmailToken: $_verifyEmailToken}';
  }

}
