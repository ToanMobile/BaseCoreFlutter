import 'package:get/get.dart';

import '../../data/api/models/response/estimator/estimator_entity.dart';
import '../../data/api/models/response/request/request_entity.dart';
import '../../data/api/services/home_service.dart';
import '../../share/constant/constant.dart';
import 'base_repository.dart';

class HomeRepository extends BaseRepository {
  final _homeService = Get.find<HomeService>();

  Future<List<EstimatorEntity>> getListEstimator({int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _homeService.getListEstimator(page, pageSize);
    return response;
  }

  Future<List<RequestEntity>> getListEstimation(String status, {int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _homeService.getListEstimation(status, page, pageSize);
    return response;
  }
}
