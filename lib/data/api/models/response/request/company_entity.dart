import '../base_entity.dart';

/// createdAt : "2022-05-24T01:44:06.940Z"
/// updatedAt : "2022-05-24T01:44:06.940Z"
/// name : "Turcotte Inc"
/// description : null
/// hashId : "xBmn2JnKP1"

class CompanyEntity extends BaseEntity {
  CompanyEntity({
    this.name,
    this.description,
    this.hashId,
  });

  CompanyEntity.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    hashId = json['hashId'];
  }

  String? name;
  String? description;
  String? hashId;

  @override
  String toString() {
    return 'CompanyEntity{name: $name, description: $description, hashId: $hashId}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['hashId'] = hashId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
