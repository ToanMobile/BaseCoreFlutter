// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['username'] as String?,
      json['password'] as String?,
      json['phone'] as String?,
      json['companyName'] as String?,
      json['numberOfStores'] as int?,
      json['country'] as String?,
      json['isSubcribed'] as bool?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'companyName': instance.companyName,
      'numberOfStores': instance.numberOfStores,
      'country': instance.country,
      'isSubcribed': instance.isSubcribed,
    };
