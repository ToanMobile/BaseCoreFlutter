import '../base_entity.dart';

/// createdAt : "2022-04-26T14:26:15.713Z"
/// updatedAt : "2022-04-26T14:26:15.713Z"
/// name : "BMW"
/// status : "active"
/// logo : null
/// hashId : "qzeAEKyZPY"

class VehiclesBrandEntity extends BaseEntity {
  VehiclesBrandModel({
    String? name,
    String? status,
    dynamic logo,
    String? hashId,
  }) {
    _name = name;
    _status = status;
    _logo = logo;
    _hashId = hashId;
  }

  @override
  String toString() {
    return 'VehiclesBrand{_name: $_name, _status: $_status}';
  }

  VehiclesBrandEntity.fromJson(dynamic json) : super.fromJson(json) {
    _name = json['name'];
    _status = json['status'];
    _logo = json['logo'];
    _hashId = json['hashId'];
  }

  String? _name;
  String? _status;
  dynamic _logo;
  String? _hashId;

  String? get name => _name;

  String? get status => _status;

  dynamic get logo => _logo;

  String? get hashId => _hashId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['logo'] = _logo;
    map['hashId'] = _hashId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
