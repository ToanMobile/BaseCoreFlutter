
import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:core/data/api/services/home_service.dart';
import 'package:get/get.dart';

import 'base_repository.dart';

class HomeRepository extends BaseRepository {
  final _homeService = Get.find<HomeService>();
  //Home
  Future<List<CoreModel>> getListNewLook(int page, int pageSize, String? query) async {
    final response = await _homeService.getListNewLook(page, pageSize, query);
    return response;
  }

  Future<List<CoreModel>> getListBoutique(int page, int pageSize, String? query) async {
    final response = await _homeService.getListBoutique(page, pageSize, query);
    return response;
  }

  Future<List<CoreModel>> getListProduct(int page, int pageSize, String? query) async {
    final response = await _homeService.getListProduct(page, pageSize, query);
    return response;
  }

  //Vestiums
  Future<List<CoreModel>> getListVestiums(int page, int pageSize, String? query) async {
    final response = await _homeService.getListVestiums(page, pageSize, query);
    return response;
  }

  Future<List<CoreModel>> getListVesSet(int page, int pageSize, String? query) async {
    final response = await _homeService.getListVesSet(page, pageSize, query);
    return response;
  }

  Future<List<CoreModel>> getListVestBrand(int page, int pageSize, String? query) async {
    final response = await _homeService.getListVestBrand(page, pageSize, query);
    return response;
  }

}
