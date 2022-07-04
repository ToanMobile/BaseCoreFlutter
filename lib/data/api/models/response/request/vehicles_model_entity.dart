/// createdAt : "2022-04-26T14:26:15.830Z"
/// updatedAt : "2022-04-26T14:26:15.830Z"
/// name : "2 Series"
/// year : "2019"
/// series : null
/// status : "active"
/// hashId : "BbWwrYpGxK"
/// hashName : "MiBTZXJpZXM="

class VehiclesModelEntity {
  VehiclesModelEntity({
    String? name,
    String? year,
    dynamic series,
    String? status,
    String? hashId,
    String? hashName,
  }) {
    _name = name;
    _year = year;
    _series = series;
    _status = status;
    _hashId = hashId;
    _hashName = hashName;
  }

  @override
  String toString() {
    return 'VehiclesModel{_name: $_name, _year: $_year, _series: $_series, _status: $_status}';
  }

  VehiclesModelEntity.fromJson(dynamic json) {
    _name = json['name'];
    _year = json['year'];
    _series = json['series'];
    _status = json['status'];
    _hashId = json['hashId'];
    _hashName = json['hashName'];
  }

  String? _name;
  String? _year;
  dynamic _series;
  String? _status;
  String? _hashId;
  String? _hashName;

  String? get name => _name;

  String? get year => _year;

  dynamic get series => _series;

  String? get status => _status;

  String? get hashId => _hashId;

  String? get hashName => _hashName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['year'] = _year;
    map['series'] = _series;
    map['status'] = _status;
    map['hashId'] = _hashId;
    map['hashName'] = _hashName;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
