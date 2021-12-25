/// favouriteId : "618eacfdb8e6e93945e6a841"
/// time : "2021-11-15T12:13:52.137Z"
/// alarm : "2021-11-15T10:13:52.137Z"
/// alarmStatus : true
/// note : "alarm notes"
import 'package:json_annotation/json_annotation.dart';

part 'profile_request.g.dart';

@JsonSerializable()
class ProfileRequest {
  String? avatar;
  String? firstName;
  String? lastName;

  ProfileRequest(this.avatar, this.firstName, this.lastName);

  factory ProfileRequest.fromJson(Map<String, dynamic> json) => _$ProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestToJson(this);

}