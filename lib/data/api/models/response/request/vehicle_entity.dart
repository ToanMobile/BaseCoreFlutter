import '../base_entity.dart';
import 'insurance_entity.dart';
import 'provinces_entity.dart';
import 'vehicles_brand_entity.dart';
import 'vehicles_model_entity.dart';

/// createdAt : "2022-05-24T02:43:20.873Z"
/// updatedAt : "2022-05-24T02:46:51.993Z"
/// vinNo : "88888899998870"
/// age : null
/// color : "Yellow"
/// fuelType : null
/// mileAge : null
/// whitePlate : "7788"
/// prbExpiryAt : "2022-05-24T00:00:00.000Z"
/// location : "31 P.Hàm Long, Hàng Bài, Hoàn Kiếm, Hà Nội, Vietnam"
/// brand : {"createdAt":"2022-05-24T01:44:06.966Z","updatedAt":"2022-05-24T01:44:06.966Z","name":"Rolls Royce","status":"active","hashId":"Ropy6gm3qE"}
/// model : {"createdAt":"2022-05-24T01:44:07.106Z","updatedAt":"2022-05-24T01:44:07.106Z","name":"Phantom","year":"2014","series":null,"status":"active","bodyType":"Sedan","hashId":"AdXeGYpr4L","hashName":"UGhhbnRvbQ=="}
/// province : {"createdAt":"2022-05-24T01:44:06.906Z","updatedAt":"2022-05-24T01:44:06.906Z","thName":"กรุงเทพมหานคร","enName":"Bangkok","area":"ภาคกลาง (Central)","startPlateChar":"","hashId":"JGX7ql5pQ2"}
/// hashId : "dQeVn6V94J"
/// insurance : {"createdAt":"2022-05-24T02:46:12.060Z","updatedAt":"2022-05-24T02:46:12.060Z","description":null,"type":"Type 2+","expiryDate":"2022-05-20T00:00:00.000Z","company":{"createdAt":"2022-05-24T01:44:06.940Z","updatedAt":"2022-05-24T01:44:06.940Z","name":"Turcotte Inc","description":null,"hashId":"xBmn2JnKP1"},"hashId":"KPwG0jzxOe"}
/// name : "2014 Rolls Royce Phantom"

class VehicleEntity extends BaseEntity {
  VehicleEntity({
    this.vinNo,
    this.age,
    this.color,
    this.fuelType,
    this.mileAge,
    this.whitePlate,
    this.prbExpiryAt,
    this.location,
    this.brand,
    this.model,
    this.province,
    this.hashId,
    this.insurance,
    this.name,
  });

  VehicleEntity.fromJson(dynamic json) {
    vinNo = json['vinNo'];
    age = json['age'];
    color = json['color'];
    fuelType = json['fuelType'];
    mileAge = json['mileAge'];
    whitePlate = json['whitePlate'];
    prbExpiryAt = json['prbExpiryAt'];
    location = json['location'];
    brand = json['brand'] != null ? VehiclesBrandEntity.fromJson(json['brand']) : null;
    model = json['model'] != null ? VehiclesModelEntity.fromJson(json['model']) : null;
    province = json['province'] != null ? ProvincesEntity.fromJson(json['province']) : null;
    insurance = json['insurance'] != null ? InsuranceEntity.fromJson(json['insurance']) : null;
    hashId = json['hashId'];
    name = json['name'];
  }

  String? vinNo;
  String? age;
  String? color;
  String? fuelType;
  num? mileAge;
  String? whitePlate;
  String? prbExpiryAt;
  String? location;
  VehiclesBrandEntity? brand;
  VehiclesModelEntity? model;
  ProvincesEntity? province;
  String? hashId;
  InsuranceEntity? insurance;

  @override
  String toString() {
    return 'VehicleEntity{vinNo: $vinNo, age: $age, color: $color, fuelType: $fuelType, mileAge: $mileAge, whitePlate: $whitePlate, prbExpiryAt: $prbExpiryAt, location: $location, brand: $brand, model: $model, province: $province, hashId: $hashId, insurance: $insurance, name: $name}';
  }

  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vinNo'] = vinNo;
    map['age'] = age;
    map['color'] = color;
    map['fuelType'] = fuelType;
    map['mileAge'] = mileAge;
    map['whitePlate'] = whitePlate;
    map['prbExpiryAt'] = prbExpiryAt;
    map['location'] = location;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (model != null) {
      map['model'] = model?.toJson();
    }
    if (province != null) {
      map['province'] = province?.toJson();
    }
    map['hashId'] = hashId;
    if (insurance != null) {
      map['insurance'] = insurance?.toJson();
    }
    map['name'] = name;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '' || value == []);
    return map;
  }
}
