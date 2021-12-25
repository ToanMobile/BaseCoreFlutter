import 'dart:convert';

import 'base_repository.dart';

class FilterRepository extends BaseRepository {
  String queryParamFilterCategory(String? categoryId) {
    Map<String, String?> queryParamsStatusActive = {'status': 'ACTIVE'};
    String queryParams = '${jsonEncode(queryParamsStatusActive)}&category=$categoryId';
    return queryParams;
  }

  String queryParamFilterItem(String? size, String? categoryId, String? brandId, String? listColorId, String? priceMin, String? priceMax) {
    Map<String, String?> queryParams = {'size': size, 'category': categoryId, 'brand': brandId, 'colorSources': listColorId, 'priceMin': priceMin, 'priceMax': priceMax};
    return jsonEncode(queryParams);
  }

  String queryParamFilterBoutique(String? seasonId, String? styleId, String? occasionId, String? listColorId, String? priceMin, String? priceMax) {
    Map<String, String?> queryParams = {'season': seasonId, 'style': styleId, 'occasion': occasionId};
    return jsonEncode(queryParams);
  }
}
