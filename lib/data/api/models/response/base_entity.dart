import 'package:flutter/cupertino.dart';

import '../../converters/date_time_converter.dart';

class BaseEntity {
  DateTime? createdAt;
  DateTime? updatedAt;
  final DateTimeConverter datetime = const DateTimeConverter();

  BaseEntity({
    @required this.createdAt,
    @required this.updatedAt,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  BaseEntity.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] != null ? datetime.fromJson(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? datetime.fromJson(json['updatedAt']) : null;
  }
}
