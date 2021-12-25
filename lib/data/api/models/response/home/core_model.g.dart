// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreModel _$CoreModelFromJson(Map<String, dynamic> json) => CoreModel(
      status: json['status'] as String?,
      source: json['source'] as String?,
      type: json['type'] as String?,
      Id: json['_id'] as String?,
      itemCustom: json['item'] == null
          ? null
          : CoreModel.fromJson(json['item'] as Map<String, dynamic>),
      itemGroups: (json['itemGroups'] as List<dynamic>?)
          ?.map((e) => ItemGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      favourite: json['isFavourite'] as bool?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      alarm: json['alarm'] == null
          ? null
          : DateTime.parse(json['alarm'] as String),
      alarmStatus: json['alarmStatus'] as bool?,
      note: json['note'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: json['price'],
    );

Map<String, dynamic> _$CoreModelToJson(CoreModel instance) => <String, dynamic>{
      '_id': instance.Id,
      'status': instance.status,
      'source': instance.source,
      'type': instance.type,
      'itemGroups': instance.itemGroups,
      'item': instance.itemCustom,
      'time': instance.time?.toIso8601String(),
      'alarm': instance.alarm?.toIso8601String(),
      'alarmStatus': instance.alarmStatus,
      'note': instance.note,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'isFavourite': instance.favourite,
    };

ColorCombine _$ColorCombineFromJson(Map<String, dynamic> json) => ColorCombine(
      status: json['status'] as String?,
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      combine: (json['combine'] as List<dynamic>?)
          ?.map((e) => Combine.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['_v'] as int?,
    );

Map<String, dynamic> _$ColorCombineToJson(ColorCombine instance) =>
    <String, dynamic>{
      'status': instance.status,
      '_id': instance.Id,
      'name': instance.name,
      'combine': instance.combine,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '_v': instance.v,
    };

Combine _$CombineFromJson(Map<String, dynamic> json) => Combine(
      patterns: (json['patterns'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CombineToJson(Combine instance) => <String, dynamic>{
      'patterns': instance.patterns,
      'colors': instance.colors,
    };

OutfitCombine _$OutfitCombineFromJson(Map<String, dynamic> json) =>
    OutfitCombine(
      order: json['order'] as int?,
      status: json['status'] as String?,
      styles:
          (json['styles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seasons:
          (json['seasons'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperatures: (json['temperatures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      colorCombines: (json['colorCombines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      dateRanges: (json['dateRanges'] as List<dynamic>?)
          ?.map((e) => DateRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      repeat: json['repeat'] as String?,
      formula: json['formula'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['_v'] as int?,
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutfitCombineToJson(OutfitCombine instance) =>
    <String, dynamic>{
      'order': instance.order,
      'status': instance.status,
      'styles': instance.styles,
      'occasions': instance.occasions,
      'seasons': instance.seasons,
      'temperatures': instance.temperatures,
      'colorCombines': instance.colorCombines,
      '_id': instance.Id,
      'name': instance.name,
      'dateRanges': instance.dateRanges,
      'repeat': instance.repeat,
      'formula': instance.formula,
      'items': instance.items,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '_v': instance.v,
      'filters': instance.filters,
    };

DateRange _$DateRangeFromJson(Map<String, dynamic> json) => DateRange(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$DateRangeToJson(DateRange instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'group': instance.group,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      categoryId: json['categoryId'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'index': instance.index,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'price': instance.price,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      min: json['min'] as int?,
      max: json['max'] as int?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

Formula _$FormulaFromJson(Map<String, dynamic> json) => Formula(
      status: json['status'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      Id: json['_id'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
      name: json['name'] as String?,
      layout: (json['layout'] as List<dynamic>?)
          ?.map((e) => Layout.fromJson(e as Map<String, dynamic>))
          .toList(),
      createAt: json['createAt'] as String?,
      v: json['_v'] as int?,
    );

Map<String, dynamic> _$FormulaToJson(Formula instance) => <String, dynamic>{
      'status': instance.status,
      'categories': instance.categories,
      '_id': instance.Id,
      'groups': instance.groups,
      'name': instance.name,
      'layout': instance.layout,
      'createAt': instance.createAt,
      '_v': instance.v,
    };

Layout _$LayoutFromJson(Map<String, dynamic> json) => Layout(
      Id: json['_id'] as String?,
      w: json['w'] as int?,
      h: json['h'] as int?,
      x: json['x'] as int?,
      y: json['y'] as int?,
      i: json['i'] as String?,
      minW: json['minW'] as int?,
      maxW: json['maxW'] as int?,
    );

Map<String, dynamic> _$LayoutToJson(Layout instance) => <String, dynamic>{
      '_id': instance.Id,
      'w': instance.w,
      'h': instance.h,
      'x': instance.x,
      'y': instance.y,
      'i': instance.i,
      'minW': instance.minW,
      'maxW': instance.maxW,
    };

ItemGroup _$ItemGroupFromJson(Map<String, dynamic> json) => ItemGroup(
      status: json['status'] as String?,
      favoriteCount: json['favoriteCount'] as int?,
      shareCount: json['shareCount'] as int?,
      likeCount: json['likeCount'] as int?,
      Id: json['_id'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as int?,
      importStatus: json['importStatus'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['_v'] as int?,
      size: json['size'],
      layout: json['layout'] == null
          ? null
          : Layout.fromJson(json['layout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemGroupToJson(ItemGroup instance) => <String, dynamic>{
      'status': instance.status,
      'favoriteCount': instance.favoriteCount,
      'shareCount': instance.shareCount,
      'likeCount': instance.likeCount,
      '_id': instance.Id,
      'brand': instance.brand,
      'category': instance.category,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'importStatus': instance.importStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '_v': instance.v,
      'size': instance.size,
      'layout': instance.layout,
    };

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) => TimeRange(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      followerCount: json['followerCount'] as int?,
      pointCount: json['pointCount'] as int?,
      loginAttemptCount: json['loginAttemptCount'] as int?,
      isBanned: json['isBanned'] as bool?,
      role: json['role'] as String?,
      isVerifiedEmail: json['isVerifiedEmail'] as bool?,
      Id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['_v'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'followerCount': instance.followerCount,
      'pointCount': instance.pointCount,
      'loginAttemptCount': instance.loginAttemptCount,
      'isBanned': instance.isBanned,
      'role': instance.role,
      'isVerifiedEmail': instance.isVerifiedEmail,
      '_id': instance.Id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '_v': instance.v,
    };
