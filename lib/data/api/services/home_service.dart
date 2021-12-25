import 'dart:async';

import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import 'base_service.dart';

class HomeService extends BaseService {

  Future<List<CoreModel>> getListNewLook(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_NEW_LOOK + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_NEW_LOOK + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    //logPrint('getListNewLook::'+ response.toString());
    return items;
  }

  Future<List<CoreModel>> getListBoutique(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_BOUTIQUE + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_BOUTIQUE + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<List<CoreModel>> getListVestiums(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_VESTIUMS + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_VESTIUMS + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<List<CoreModel>> getListVesSet(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_VES_SET + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_VES_SET + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<List<CoreModel>> getListVestBrand(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_VES_BRAND + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_VES_BRAND + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<List<CoreModel>> getListProduct(int page, int pageSize, String? query) async {
    dynamic response;
    if (query != null) {
      response = await get(sprintf(GET_PRODUCT + pageSizeAndFilter, [page, pageSize, query]));
    } else {
      response = await get(sprintf(GET_PRODUCT + pageAndSize, [page, pageSize]));
    }
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

}
