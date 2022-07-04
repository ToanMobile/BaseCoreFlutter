import '../../../converters/date_time_converter.dart';
import '../base_entity.dart';
import 'company_entity.dart';

/// createdAt : "2022-05-24T02:46:12.060Z"
/// updatedAt : "2022-05-24T02:46:12.060Z"
/// description : null
/// type : "Type 2+"
/// expiryDate : "2022-05-20T00:00:00.000Z"
/// company : {"createdAt":"2022-05-24T01:44:06.940Z","updatedAt":"2022-05-24T01:44:06.940Z","name":"Turcotte Inc","description":null,"hashId":"xBmn2JnKP1"}
/// hashId : "KPwG0jzxOe"

class InsuranceEntity extends BaseEntity {
  InsuranceEntity({
    this.description,
    this.type,
    this.expiryDate,
    this.company,
    this.hashId,
  });

  InsuranceEntity.fromJson(dynamic json) {
    description = json['description'];
    type = json['type'];
    expiryDate = const DateTimeConverter().fromJson(json['expiryDate']);
    company = json['company'] != null ? CompanyEntity.fromJson(json['company']) : null;
    hashId = json['hashId'];
  }

  String? description;
  String? type;
  DateTime? expiryDate;
  CompanyEntity? company;
  String? hashId;

  @override
  String toString() {
    return 'InsuranceEntity{description: $description, type: $type, expiryDate: $expiryDate, company: $company, hashId: $hashId}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['type'] = type;
    map['expiryDate'] = expiryDate;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['hashId'] = hashId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
