import '../base_entity.dart';

/// createdAt : "2022-05-24T01:44:06.906Z"
/// updatedAt : "2022-05-24T01:44:06.906Z"
/// thName : "กรุงเทพมหานคร"
/// enName : "Bangkok"
/// area : "ภาคกลาง (Central)"
/// startPlateChar : ""
/// hashId : "JGX7ql5pQ2"

class ProvincesEntity extends BaseEntity {
  ProvincesEntity({
    this.thName,
    this.enName,
    this.area,
    this.startPlateChar,
    this.hashId,
  });

  ProvincesEntity.fromJson(dynamic json) {
    thName = json['thName'];
    enName = json['enName'];
    area = json['area'];
    startPlateChar = json['startPlateChar'];
    hashId = json['hashId'];
  }

  String? thName;
  String? enName;
  String? area;
  String? startPlateChar;
  String? hashId;

  @override
  String toString() {
    return 'ProvincesEntity{thName: $thName, enName: $enName, area: $area, startPlateChar: $startPlateChar, hashId: $hashId}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thName'] = thName;
    map['enName'] = enName;
    map['area'] = area;
    map['startPlateChar'] = startPlateChar;
    map['hashId'] = hashId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
