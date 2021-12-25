import 'dart:convert';

FilterRequestItem filterRequestItemFromJson(String str) =>
    FilterRequestItem.fromJson(json.decode(str));

String filterRequestItemToJson(FilterRequestItem data) =>
    json.encode(data.toJson());

class FilterRequestItem {
  FilterRequestItem({
    this.key,
    this.value,
  });

  String? key;
  dynamic value;

  factory FilterRequestItem.fromJson(Map<String, dynamic> json) =>
      FilterRequestItem(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };

  @override
  String toString() {
    return 'FilterRequestItem{\$key: $key  \$value: $value }';
  }
}

class Nindata {
  Nindata({this.$nin});

  List<String?>? $nin;

  factory Nindata.fromJson(Map<String, dynamic> json) => Nindata(
        $nin: json["\$nin"],
      );

  Map<String, dynamic> toJson() => {
        "\$nin": $nin,
      };

  @override
  String toString() {
    return '$Nindata{\$nin: ${$nin}}';
  }
}

class Indata {
  Indata({this.$in});

  List<String?>? $in;

  factory Indata.fromJson(Map<String, dynamic> json) => Indata(
        $in: json["\$in"],
      );

  Map<String, dynamic> toJson() => {
        "\$in": $in,
      };

  @override
  String toString() {
    return 'Indata{\$in: ${$in}}';
  }
}
class PostFilterRequest {
  PostFilterRequest({this.sorts, this.filters, this.isDefault});

  List<FilterRequestItem>? sorts;
  List<FilterRequestItem>? filters;
  bool? isDefault;

  factory PostFilterRequest.fromJson(Map<String, dynamic> json) =>
      PostFilterRequest(
        sorts: json["sorts"] != null
            ? List<FilterRequestItem>.from(
            json["sorts"].map((x) => FilterRequestItem.fromJson(x)))
            : [],
        filters: json["filters"] != null
            ? List<FilterRequestItem>.from(
            json["filters"].map((x) => FilterRequestItem.fromJson(x)))
            : [],
        isDefault: json["isDefault"] ?? false,);

  Map<String, dynamic> toJson() => {
    "sorts": sorts?.isNotEmpty == true
        ? List<dynamic>.from(sorts!.map((x) => x.toJson()))
        : [],
    "filters": filters?.isNotEmpty == true
        ? List<dynamic>.from(filters!.map((x) => x.toJson()))
        : [],
    "isDefault": isDefault,
  };

  @override
  String toString() {
    return 'FilterRequestItem{sorts: $sorts  filters: $filters ,isDefault $isDefault }';
  }
}
