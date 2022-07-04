import '../../customer_entity.dart';
import '../base_entity.dart';

/// createdAt : "2022-04-27T09:07:35.653Z"
/// updatedAt : "2022-04-27T09:07:35.653Z"
/// fromStatus : ""
/// toStatus : "draft"
/// historyType : "create"
/// createdBy : {"displayName":"sales person A","createdAt":"2022-04-27T07:59:14.150Z","updatedAt":"2022-04-27T07:59:14.150Z","mobile":"","firstName":"sales person","lastName":"A","lang":"en","isVipCustomer":false,"hashId":"m76lwGl9oZ","roleName":""}
/// hashId : "D7YXEeXa19"

class HistoriesEntity extends BaseEntity {
  HistoriesEntity({
    String? fromStatus,
    String? toStatus,
    String? historyType,
    Customer? createdBy,
    String? hashId,
  }) {
    _fromStatus = fromStatus;
    _toStatus = toStatus;
    _historyType = historyType;
    _createdBy = createdBy;
    _hashId = hashId;
  }

  @override
  String toString() {
    return 'His{_fromStatus: $_fromStatus, _toStatus: $_toStatus, _historyType: $_historyType, _createdBy: $_createdBy, _hashId: $_hashId}';
  }

  HistoriesEntity.fromJson(dynamic json) : super.fromJson(json) {
    _fromStatus = json['fromStatus'];
    _toStatus = json['toStatus'];
    _historyType = json['historyType'];
    _createdBy = json['createdBy'] != null ? Customer.fromJson(json['createdBy']) : null;
    _hashId = json['hashId'];
  }

  String? _fromStatus;
  String? _toStatus;
  String? _historyType;
  Customer? _createdBy;
  String? _hashId;

  HistoriesEntity copyWith({
    String? fromStatus,
    String? toStatus,
    String? historyType,
    Customer? createdBy,
    String? hashId,
  }) =>
      HistoriesEntity(
        fromStatus: fromStatus ?? _fromStatus,
        toStatus: toStatus ?? _toStatus,
        historyType: historyType ?? _historyType,
        createdBy: createdBy ?? _createdBy,
        hashId: hashId ?? _hashId,
      );

  String? get fromStatus => _fromStatus;

  String? get toStatus => _toStatus;

  String? get historyType => _historyType;

  Customer? get createdBy => _createdBy;

  String? get hashId => _hashId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fromStatus'] = _fromStatus;
    map['toStatus'] = _toStatus;
    map['historyType'] = _historyType;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['hashId'] = _hashId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
