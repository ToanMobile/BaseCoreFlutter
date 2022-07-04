import 'response/base_entity.dart';

/// displayName : "Kiet Tan Le"
/// createdAt : "2022-04-27T18:07:13.246Z"
/// updatedAt : "2022-04-27T18:07:13.246Z"
/// mobile : "0909009911"
/// firstName : ""
/// lastName : ""
/// lang : "en"
/// isVipCustomer : false
/// hashId : "5mDlVvlodE"
/// roleName : ""

class Customer extends BaseEntity {
  Customer({
    String? displayName,
    String? mobile,
    String? firstName,
    String? lastName,
    String? lang,
    bool? isVipCustomer,
    String? hashId,
    String? roleName,
  }) {
    _displayName = displayName;
    _mobile = mobile;
    _firstName = firstName;
    _lastName = lastName;
    _lang = lang;
    _isVipCustomer = isVipCustomer;
    _hashId = hashId;
    _roleName = roleName;
  }

  Customer.fromJson(dynamic json) : super.fromJson(json) {
    _displayName = json['displayName'];
    _mobile = json['mobile'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _lang = json['lang'];
    _isVipCustomer = json['isVipCustomer'];
    _hashId = json['hashId'];
    _roleName = json['roleName'];
  }

  String? _displayName;
  String? _mobile;
  String? _firstName;
  String? _lastName;
  String? _lang;
  bool? _isVipCustomer;
  String? _hashId;
  String? _roleName;

  Customer copyWith({
    String? displayName,
    String? mobile,
    String? firstName,
    String? lastName,
    String? lang,
    bool? isVipCustomer,
    String? hashId,
    String? roleName,
  }) =>
      Customer(
        displayName: displayName ?? _displayName,
        mobile: mobile ?? _mobile,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        lang: lang ?? _lang,
        isVipCustomer: isVipCustomer ?? _isVipCustomer,
        hashId: hashId ?? _hashId,
        roleName: roleName ?? _roleName,
      );

  String? get displayName => _displayName;

  String? get mobile => _mobile;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get lang => _lang;

  bool? get isVipCustomer => _isVipCustomer;

  String? get hashId => _hashId;

  String? get roleName => _roleName;

  @override
  String toString() {
    return 'Customer{_displayName: $_displayName, _mobile: $_mobile, _firstName: $_firstName, _lastName: $_lastName, _lang: $_lang, _isVipCustomer: $_isVipCustomer, _hashId: $_hashId, _roleName: $_roleName}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = _displayName;
    map['mobile'] = _mobile;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['lang'] = _lang;
    map['isVipCustomer'] = _isVipCustomer;
    map['hashId'] = _hashId;
    map['roleName'] = _roleName;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '' || value == []);
    return map;
  }
}
