import 'dart:async';

import 'package:sprintf/sprintf.dart';

import '../../../data/api/api_constants.dart';
import '../../../data/api/models/response/request/request_entity.dart';
import '../models/response/estimator/estimator_entity.dart';
import 'base_service.dart';

class HomeService extends BaseService {
  static bool isOffline = true;

  Future<List<RequestEntity>> getListEstimation(String status, int page, int pageSize) async {
    final response = await get(sprintf(GET_ESTIMATION, [page, pageSize, status]));
    final items = List<RequestEntity>.from(response.map((item) => RequestEntity.fromJson(item)));
    return items;
  }

  Future<List<EstimatorEntity>> getListEstimator(int page, int pageSize) async {
    final response = await get(sprintf(GET_ESTIMATOR, [page, pageSize]));
    final items = List<EstimatorEntity>.from(response.map((item) => EstimatorEntity.fromJson(item)));
    return items;
  }
}
