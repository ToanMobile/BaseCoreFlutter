import 'package:get/get.dart';

import '../../data/api/models/request/create_request_request.dart';
import '../../data/api/models/response/request/vehicles_brand_entity.dart';
import '../../data/api/models/response/request/vehicles_model_entity.dart';
import '../../share/constant/constant.dart';
import '../api/models/response/request/request_entity.dart';
import '../api/models/response/request/search_vinid_entity.dart';
import '../api/services/request_service.dart';
import 'base_repository.dart';

class RequestRepository extends BaseRepository {
  final _requestService = Get.find<RequestService>();

  Future<RequestEntity> createRequest(CreateRequestRequest createRequestRequest) async {
    final response = await _requestService.createRequest(createRequestRequest);
    return response;
  }

  Future<RequestEntity> updateRequest(String? requestId, CreateRequestRequest createRequestRequest) async {
    final response = await _requestService.updateRequest(requestId ?? '', createRequestRequest);
    return response;
  }

  Future<RequestEntity> getRequestDetails(String requestID) async {
    final response = await _requestService.getRequestDetails(requestID);
    return response;
  }

  Future<SearchVinIDEntity> searchVehicles(String vinId) async {
    final response = await _requestService.searchVehicles(vinId);
    return response;
  }

  Future<List<VehiclesBrandEntity>> getVehiclesBrand({int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _requestService.getVehiclesBrand(page, pageSize);
    return response;
  }

  Future<List<VehiclesModelEntity>> getVehiclesModel(String year, String brandId, {int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _requestService.getVehiclesModel(year, brandId, page, pageSize);
    return response;
  }

  Future<List<String>> getYear(String modelName) async {
    final response = await _requestService.getYear(modelName);
    return response;
  }

  Future<void> postArchive(String hashId) async {
    final response = await _requestService.postArchive(hashId);
    return response;
  }

  Future<void> postAccept(String hashId) async {
    final response = await _requestService.postAccept(hashId);
    return response;
  }
}
