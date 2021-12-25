import 'package:json_annotation/json_annotation.dart';

abstract class EnumConverter<T> implements JsonConverter<T, String> {
  const EnumConverter();

  List<T> get values;

  @override
  T fromJson(String value) {
    return values
        .firstWhere((type) => type.toString().split(".").last == value);
  }

  @override
  String toJson(T value) => value.toString().split(".").last;
}
