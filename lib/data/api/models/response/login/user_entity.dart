import '../base_entity.dart';
import 'file_entity.dart';

class UserEntity extends BaseEntity {
  String? hashId;
  String? username;
  String? email;
  String? mobile;
  String? firstName;
  String? lastName;
  String? displayName;
  String? status;
  String? gender;
  String? lang;
  String? roleName;
  String? nationalId;
  String? address;
  FileEntity? profilePhoto;

  String? get userName => '${firstName ?? ''} ${lastName ?? ''}';

  UserEntity({
    this.hashId,
    this.username,
    this.email,
    this.mobile,
    this.firstName,
    this.lastName,
    this.displayName,
    this.status,
    this.gender,
    this.lang,
    this.roleName,
    this.nationalId,
    this.address,
    this.profilePhoto,
  });

  @override
  String toString() {
    return 'UserEntity{hashId: $hashId, username: $username, email: $email, mobile: $mobile, firstName: $firstName, lastName: $lastName, displayName: $displayName, status: $status, gender: $gender, lang: $lang, roleName: $roleName, nationalId: $nationalId, address: $address, profilePhoto: $profilePhoto}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      hashId: json['hashId'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      displayName: json['displayName'],
      status: json['status'],
      gender: json['gender'],
      lang: json['lang'],
      roleName: json['roleName'],
      nationalId: json['nationalId'],
      address: json['address'],
      profilePhoto: json['profilePhoto'] != null ? FileEntity.fromJson(json['profilePhoto']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hashId': hashId,
      'username': username,
      'email': email,
      'mobile': mobile,
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'status': status,
      'gender': gender,
      'lang': lang,
      'roleName': roleName,
      'nationalId': nationalId,
      'address': address,
      'profilePhoto': profilePhoto != null ? profilePhoto!.toJson() : null,
    };
  }
}
