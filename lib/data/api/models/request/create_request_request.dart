import '../document_entity.dart';

/// isSubmitted : true
/// step : "took-front-photo"
/// customerName : "Terabit"
/// customerPhone : "09871511111"
/// isVipCustomer : true
/// sellingPurpose : "trade-in-nc"
/// sellingPurposeNote : "MFC 23201212121"
/// whitePlate : "N-1111"
/// location : "16 Phetchaburi Rd, Thanon Phetchaburi, Ratchathewi, Bangkok"
/// hashBrandId : "qzeAEKyZPY"
/// hashModelId : "VEd1JmeqWZ"
/// vinNo : "MMF54AD080Y100755"
/// hashCompanyId : "Q6knO9rOEe"
/// hashInsuranceId : "Q6knO9rOEe"
/// insuranceType : "Type 1"
/// expiryDate : "2023-04-21"
/// prbExpiryAt : "2023-04-21"
/// hashProvinceId : "AbQZ1mZJ2l"
/// fuelType : "liquid"
/// mileAge : 10
/// color : "red"
/// customerExpectedPrice : 20000
/// documents : [{"hashId":"Jk2GYAGnZg","hashFileId":"Jk2GYAGnZg","type":"vehicle-ownership","description":"string","notes":{"hashId":"Jk2GYAGnZg","description":"Need to re-paint","x":100,"y":200}}]

class CreateRequestRequest {
  CreateRequestRequest({
    this.hashId,
    this.isSubmitted,
    this.step,
    this.customerName,
    this.customerPhone,
    this.isVipCustomer,
    this.sellingPurpose,
    this.sellingPurposeNote,
    this.whitePlate,
    this.location,
    this.hashBrandId,
    this.hashModelId,
    this.vinNo,
    this.hashCompanyId,
    this.hashInsuranceId,
    this.insuranceType,
    this.expiryDate,
    this.prbExpiryAt,
    this.hashProvinceId,
    this.fuelType,
    this.mileAge,
    this.color,
    this.customerExpectedPrice,
    required this.documents,
  });

  CreateRequestRequest.fromJson(dynamic json) {
    isSubmitted = json['isSubmitted'];
    step = json['step'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    isVipCustomer = json['isVipCustomer'];
    sellingPurpose = json['sellingPurpose'];
    sellingPurposeNote = json['sellingPurposeNote'];
    whitePlate = json['whitePlate'];
    location = json['location'];
    hashBrandId = json['hashBrandId'];
    hashModelId = json['hashModelId'];
    vinNo = json['vinNo'];
    hashCompanyId = json['hashCompanyId'];
    hashInsuranceId = json['hashInsuranceId'];
    insuranceType = json['insuranceType'];
    expiryDate = json['expiryDate'];
    prbExpiryAt = json['prbExpiryAt'];
    hashProvinceId = json['hashProvinceId'];
    fuelType = json['fuelType'];
    mileAge = json['mileAge'];
    color = json['color'];
    customerExpectedPrice = json['customerExpectedPrice'];
    if (json['documents'] != null) {
      documents = [];
      json['documents'].forEach((v) {
        documents.add(DocumentsEntity.fromJson(v));
      });
    }
  }

  String? hashId;
  bool? isSubmitted;
  String? step;
  String? customerName;
  String? customerPhone;
  bool? isVipCustomer;
  String? sellingPurpose;
  String? sellingPurposeNote;
  String? whitePlate;
  String? location;
  String? hashBrandId;
  String? hashModelId;
  String? vinNo;
  String? hashCompanyId;
  String? hashInsuranceId;
  String? insuranceType;
  String? expiryDate;
  String? prbExpiryAt;
  String? hashProvinceId;
  String? fuelType;
  int? mileAge;
  String? color;
  int? customerExpectedPrice;
  List<DocumentsEntity> documents = [];

  @override
  String toString() {
    return 'CreateRequestRequest{hashId: $hashId, isSubmitted: $isSubmitted, step: $step, customerName: $customerName, customerPhone: $customerPhone, isVipCustomer: $isVipCustomer, sellingPurpose: $sellingPurpose, sellingPurposeNote: $sellingPurposeNote, whitePlate: $whitePlate, location: $location, hashBrandId: $hashBrandId, hashModelId: $hashModelId, vinNo: $vinNo, hashCompanyId: $hashCompanyId, hashInsuranceId: $hashInsuranceId, insuranceType: $insuranceType, expiryDate: $expiryDate, prbExpiryAt: $prbExpiryAt, hashProvinceId: $hashProvinceId, fuelType: $fuelType, mileAge: $mileAge, color: $color, customerExpectedPrice: $customerExpectedPrice, documents: $documents}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSubmitted'] = isSubmitted;
    map['step'] = step;
    map['customerName'] = customerName;
    map['customerPhone'] = customerPhone;
    map['isVipCustomer'] = isVipCustomer;
    map['sellingPurpose'] = sellingPurpose;
    map['sellingPurposeNote'] = sellingPurposeNote;
    map['whitePlate'] = whitePlate;
    map['location'] = location;
    map['hashBrandId'] = hashBrandId;
    map['hashModelId'] = hashModelId;
    map['vinNo'] = vinNo;
    map['hashCompanyId'] = hashCompanyId;
    map['hashInsuranceId'] = hashInsuranceId;
    map['insuranceType'] = insuranceType;
    map['expiryDate'] = expiryDate;
    map['prbExpiryAt'] = prbExpiryAt;
    map['hashProvinceId'] = hashProvinceId;
    map['fuelType'] = fuelType;
    map['mileAge'] = mileAge;
    map['color'] = color;
    map['customerExpectedPrice'] = customerExpectedPrice;
    if (documents.isNotEmpty) {
      map['documents'] = documents.map((v) => v.toJson()).toList();
    }
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '' || value == []);
    return map;
  }
}
