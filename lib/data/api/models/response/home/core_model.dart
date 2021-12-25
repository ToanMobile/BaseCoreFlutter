import 'package:json_annotation/json_annotation.dart';

part 'core_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CoreModel {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'source')
  final String? source;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'itemGroups')
  final List<ItemGroup>? itemGroups;
  @JsonKey(name: 'item')
  final CoreModel? itemCustom;
  @JsonKey(name: 'time')
  final DateTime? time;
  @JsonKey(name: 'alarm')
  final DateTime? alarm;
  @JsonKey(name: 'alarmStatus')
  final bool? alarmStatus;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'price')
  final dynamic price;
  @JsonKey(name: 'isFavourite')
  bool? favourite = false;

  void clickFavourite() {
    favourite = !(favourite ?? false);
  }

  List<ItemGroup>? get listItem => itemGroups ?? itemCustom?.itemGroups;

  CoreModel({
    this.status,
    this.source,
    this.type,
    this.Id,
    this.itemCustom,
    this.itemGroups,
    this.favourite,
    this.time,
    this.alarm,
    this.alarmStatus,
    this.note,
    this.image,
    this.name,
    this.price,
  });

  factory CoreModel.fromJson(Map<String, dynamic> json) => _$CoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoreModelToJson(this);

  @override
  String toString() {
    return 'CoreModel{Id: $Id, status: $status, source: $source, type: $type, itemGroups: $itemGroups, itemCustom: $itemCustom, time: $time, alarm: $alarm, alarmStatus: $alarmStatus, note: $note, image: $image, name: $name, price: $price, favourite: $favourite}';
  }
}

@JsonSerializable(ignoreUnannotated: false)
class ColorCombine {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'combine')
  final List<Combine>? combine;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '_v')
  final int? v;

  ColorCombine({this.status, this.Id, this.name, this.combine, this.createdAt, this.updatedAt, this.v});

  factory ColorCombine.fromJson(Map<String, dynamic> json) => _$ColorCombineFromJson(json);

  Map<String, dynamic> toJson() => _$ColorCombineToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Combine {
  @JsonKey(name: 'patterns')
  final List<String>? patterns;
  @JsonKey(name: 'colors')
  final List<String>? colors;

  Combine({this.patterns, this.colors});

  factory Combine.fromJson(Map<String, dynamic> json) => _$CombineFromJson(json);

  Map<String, dynamic> toJson() => _$CombineToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class OutfitCombine {
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'styles')
  final List<String>? styles;
  @JsonKey(name: 'occasions')
  final List<String>? occasions;
  @JsonKey(name: 'seasons')
  final List<String>? seasons;
  @JsonKey(name: 'temperatures')
  final List<String>? temperatures;
  @JsonKey(name: 'colorCombines')
  final List<String>? colorCombines;
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'dateRanges')
  final List<DateRange>? dateRanges;
  @JsonKey(name: 'repeat')
  final String? repeat;
  @JsonKey(name: 'formula')
  final String? formula;
  @JsonKey(name: 'items')
  final List<Item>? items;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '_v')
  final int? v;
  @JsonKey(name: 'filters')
  final Filters? filters;

  OutfitCombine(
      {this.order,
      this.status,
      this.styles,
      this.occasions,
      this.seasons,
      this.temperatures,
      this.colorCombines,
      this.Id,
      this.name,
      this.dateRanges,
      this.repeat,
      this.formula,
      this.items,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.filters});

  factory OutfitCombine.fromJson(Map<String, dynamic> json) => _$OutfitCombineFromJson(json);

  Map<String, dynamic> toJson() => _$OutfitCombineToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class DateRange {
  @JsonKey(name: 'startDate')
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;

  DateRange({this.startDate, this.endDate});

  factory DateRange.fromJson(Map<String, dynamic> json) => _$DateRangeFromJson(json);

  Map<String, dynamic> toJson() => _$DateRangeToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Item {
  @JsonKey(name: 'group')
  final Group? group;

  Item({this.group});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Group {
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'index')
  final int? index;

  Group({this.categoryId, this.index});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Filters {
  @JsonKey(name: 'price')
  final Price? price;

  Filters({this.price});

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Price {
  @JsonKey(name: 'min')
  final int? min;
  @JsonKey(name: 'max')
  final int? max;

  Price({this.min, this.max});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Formula {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'categories')
  final List<String>? categories;
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'groups')
  final List<List>? groups;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'layout')
  final List<Layout>? layout;
  @JsonKey(name: 'createAt')
  final String? createAt;
  @JsonKey(name: '_v')
  final int? v;

  Formula({this.status, this.categories, this.Id, this.groups, this.name, this.layout, this.createAt, this.v});

  factory Formula.fromJson(Map<String, dynamic> json) => _$FormulaFromJson(json);

  Map<String, dynamic> toJson() => _$FormulaToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Layout {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'w')
  final int? w;
  @JsonKey(name: 'h')
  final int? h;
  @JsonKey(name: 'x')
  final int? x;
  @JsonKey(name: 'y')
  final int? y;
  @JsonKey(name: 'i')
  final String? i;
  @JsonKey(name: 'minW')
  final int? minW;
  @JsonKey(name: 'maxW')
  final int? maxW;

  @override
  String toString() {
    return 'Layout{w: $w, h: $h, x: $x, y: $y}';
  }

  Layout({this.Id, this.w, this.h, this.x, this.y, this.i, this.minW, this.maxW});

  factory Layout.fromJson(Map<String, dynamic> json) => _$LayoutFromJson(json);

  Map<String, dynamic> toJson() => _$LayoutToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ItemGroup {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'favoriteCount')
  final int? favoriteCount;
  @JsonKey(name: 'shareCount')
  final int? shareCount;
  @JsonKey(name: 'likeCount')
  final int? likeCount;
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'brand')
  final String? brand;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'importStatus')
  final String? importStatus;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '_v')
  final int? v;
  @JsonKey(name: 'size')
  final dynamic size;
  @JsonKey(name: 'layout')
  final Layout? layout;

  /*@JsonKey(name: 'user')
  final User? user;
  @JsonKey(name: 'group')
  final Group? group;
  @JsonKey(name: 'subcategory')
  final List<String>? subcategory;
  @JsonKey(name: 'figures')
  final List<String>? figures;
  @JsonKey(name: 'thickness')
  final List<String>? thickness;
  @JsonKey(name: 'patterns')
  final List<String>? patterns;
  @JsonKey(name: 'materials')
  final List<String>? materials;
  @JsonKey(name: 'colors')
  final List<String>? colors;*/

  @override
  String toString() {
    return 'ItemGroup{status: $status, Id: $Id, category: $category, name: $name, image: $image}';
  }

  ItemGroup({
    this.status,
    this.favoriteCount,
    this.shareCount,
    this.likeCount,
    this.Id,
    this.brand,
    this.category,
    this.name,
    this.image,
    this.price,
    this.importStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.size,
    this.layout,
    /*
       this.user,
      this.group,
      this.subcategory,
      this.figures,
      this.thickness,
      this.patterns,
      this.materials,
      this.colors,*/
  });

  factory ItemGroup.fromJson(Map<String, dynamic> json) => _$ItemGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ItemGroupToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class TimeRange {
  @JsonKey(name: 'startDate')
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;

  TimeRange({this.startDate, this.endDate});

  factory TimeRange.fromJson(Map<String, dynamic> json) => _$TimeRangeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class User {
  @JsonKey(name: 'followerCount')
  final int? followerCount;
  @JsonKey(name: 'pointCount')
  final int? pointCount;
  @JsonKey(name: 'loginAttemptCount')
  final int? loginAttemptCount;
  @JsonKey(name: 'isBanned')
  final bool? isBanned;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'isVerifiedEmail')
  final bool? isVerifiedEmail;
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '_v')
  final int? v;

  User(
      {this.followerCount,
      this.pointCount,
      this.loginAttemptCount,
      this.isBanned,
      this.role,
      this.isVerifiedEmail,
      this.Id,
      this.firstName,
      this.lastName,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
