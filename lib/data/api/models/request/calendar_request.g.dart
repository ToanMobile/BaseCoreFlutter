// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarRequest _$CalendarRequestFromJson(Map<String, dynamic> json) =>
    CalendarRequest(
      json['favouriteId'] as String?,
      json['time'] == null ? null : DateTime.parse(json['time'] as String),
      json['alarm'] == null ? null : DateTime.parse(json['alarm'] as String),
      json['alarmStatus'] as bool?,
      json['note'] as String?,
    );

Map<String, dynamic> _$CalendarRequestToJson(CalendarRequest instance) =>
    <String, dynamic>{
      'favouriteId': instance.favouriteId,
      'time': instance.time?.toIso8601String(),
      'alarm': instance.alarm?.toIso8601String(),
      'alarmStatus': instance.alarmStatus,
      'note': instance.note,
    };
