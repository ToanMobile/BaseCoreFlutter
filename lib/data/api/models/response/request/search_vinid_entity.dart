import 'vehicles_brand_entity.dart';
import 'vehicles_model_entity.dart';

/// brand : {"createdAt":"2022-04-27T07:59:14.296Z","updatedAt":"2022-04-27T07:59:14.296Z","name":"Mini","status":"active","hashId":"R7VmjJmgz1"}

class SearchVinIDEntity {
  SearchVinIDEntity({
    VehiclesBrandEntity? brand,
    VehiclesModelEntity? model,
  }) {
    _brand = brand;
    _model = model;
  }

  @override
  String toString() {
    return 'SearchVinIDEntity{_brand: $_brand, _model: $_model}';
  }

  SearchVinIDEntity.fromJson(dynamic json) {
    _brand = json['brand'] != null ? VehiclesBrandEntity.fromJson(json['brand']) : null;
    _model = json['model'] != null ? VehiclesModelEntity.fromJson(json['model']) : null;
  }

  VehiclesBrandEntity? _brand;
  VehiclesModelEntity? _model;

  VehiclesBrandEntity? get brand => _brand;

  VehiclesModelEntity? get model => _model;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_model != null) {
      map['model'] = _model?.toJson();
    }
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
