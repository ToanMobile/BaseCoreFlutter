/// favouriteId : "618eacfdb8e6e93945e6a841"
/// time : "2021-11-15T12:13:52.137Z"
/// alarm : "2021-11-15T10:13:52.137Z"
/// alarmStatus : true
/// note : "alarm notes"
import 'package:json_annotation/json_annotation.dart';

part 'calendar_request.g.dart';

@JsonSerializable()
class CalendarRequest {
  String? favouriteId;
  DateTime? time;
  DateTime? alarm;
  bool? alarmStatus;
  String? note;

  CalendarRequest(this.favouriteId, this.time, this.alarm, this.alarmStatus, this.note);

  factory CalendarRequest.fromJson(Map<String, dynamic> json) => _$CalendarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarRequestToJson(this);

}