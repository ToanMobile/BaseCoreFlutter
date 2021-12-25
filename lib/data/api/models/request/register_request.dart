/// favouriteId : "618eacfdb8e6e93945e6a841"
/// time : "2021-11-15T12:13:52.137Z"
/// alarm : "2021-11-15T10:13:52.137Z"
/// alarmStatus : true
/// note : "alarm notes"
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? password;
  String? phone;
  String? companyName;
  int? numberOfStores;
  String? country;
  bool? isSubcribed;

  RegisterRequest(this.firstName, this.lastName, this.email, this.username, this.password, this.phone, this.companyName, this.numberOfStores, this.country, this.isSubcribed);

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

}