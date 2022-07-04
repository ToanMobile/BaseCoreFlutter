import 'dart:convert';

import 'package:sprintf/sprintf.dart';

import '../../../share/libraries/logger/flutter_logger.dart';
import '../api_constants.dart';
import '../models/request/create_request_request.dart';
import '../models/response/request/request_entity.dart';
import '../models/response/request/search_vinid_entity.dart';
import '../models/response/request/vehicles_brand_entity.dart';
import '../models/response/request/vehicles_model_entity.dart';
import 'base_service.dart';

class RequestService extends BaseService {
  static CreateRequestRequest createRequestRequest = CreateRequestRequest(documents: []);

  Future<RequestEntity> createRequest(CreateRequestRequest createRequestRequest) async {
    final postData = jsonEncode(createRequestRequest.toJson());
    Logger.e('createRequest:' + postData);
    final response = await post(CREATE_REQUEST, data: postData);
    final requestEntity = RequestEntity.fromJson(response);
    RequestService.createRequestRequest.hashId = requestEntity.hashId;
    Logger.e('createRequest:' + RequestService.createRequestRequest.toString());
    return requestEntity;
  }

  Future<RequestEntity> updateRequest(String requestId, CreateRequestRequest createRequestRequest) async {
    final postData = jsonEncode(createRequestRequest.toJson());
    Logger.e('postData:' + postData.toString());
    final response = await put(sprintf(UPDATE_REQUEST, [requestId]), data: postData);
    final requestEntity = RequestEntity.fromJson(response);
    Logger.e('updateRequest:' + RequestService.createRequestRequest.toString());
    return requestEntity;
  }

  Future<RequestEntity> getRequestDetails(String requestID) async {
    final response = await get(sprintf(GET_REQUEST, [requestID]));
    return RequestEntity.fromJson(response);
  }

  Future<SearchVinIDEntity> searchVehicles(String vinID) async {
    final response = await get(sprintf(SEARCH_VEHICLES, [vinID]));
    return SearchVinIDEntity.fromJson(response);
  }

  Future<List<VehiclesBrandEntity>> getVehiclesBrand(int page, int pageSize) async {
    final response = await get(sprintf(GET_VEHICLES_BRAND, [page, pageSize]));
    final items = List<VehiclesBrandEntity>.from(response.map((item) => VehiclesBrandEntity.fromJson(item)));
    return items;
  }

  Future<List<VehiclesModelEntity>> getVehiclesModel(String year, String brandId, int page, int pageSize) async {
    final response = await get(sprintf(GET_VEHICLES_MODEL, [page, pageSize, year, brandId]));
    final items = List<VehiclesModelEntity>.from(response.map((item) => VehiclesModelEntity.fromJson(item)));
    return items;
  }

  Future<List<String>> getYear(String modelName) async {
    final response = await get(sprintf(GET_YEAR, [modelName]));
    final items = List<String>.from(response.map((item) => item));
    return items;
  }

  Future<void> postAccept(String hashId) async {
    await patch(sprintf(POST_ACCEPT, [hashId]));
  }

  Future<void> postArchive(String hashId) async {
    await patch(sprintf(POST_ARCHIVE, [hashId]));
  }
}
