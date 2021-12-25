// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) =>
    ProfileRequest(
      json['avatar'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
    );

Map<String, dynamic> _$ProfileRequestToJson(ProfileRequest instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
