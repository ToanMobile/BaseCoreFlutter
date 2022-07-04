/// name : "Estimator 1"
/// status : "free"
/// branchName : "Quigley - Fay"
/// hashId : "v9QrXBb5eX"

class Tessttt {
  Tessttt({
    this.name,
    this.status,
    this.branchName,
    this.hashId,
  });

  Tessttt.fromJson(dynamic json) {
    name = json['name'];
    status = json['status'];
    branchName = json['branchName'];
    hashId = json['hashId'];
  }

  String? name;
  String? status;
  String? branchName;
  String? hashId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['status'] = status;
    map['branchName'] = branchName;
    map['hashId'] = hashId;
    return map;
  }
}
