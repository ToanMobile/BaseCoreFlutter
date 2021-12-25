import 'package:core/data/api/models/request/favourite_request.dart';
import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:core/data/api/services/favourite_service.dart';
import 'package:get/get.dart';

import 'base_repository.dart';

class FavouriteRepository extends BaseRepository {
  final _favouriteService = Get.find<FavouriteService>();

  Future<List<CoreModel>> getListFavourite(int page, int pageSize) async {
    final response = await _favouriteService.getListFavourite(page, pageSize);
    return response;
  }

  Future<void> postFavourite(FavouriteRequest favouriteRequest) async {
    final response = await _favouriteService.postFavourite(favouriteRequest);
    return response;
  }

  Future<void> deleteFavourite(String id, String source) async {
    return await _favouriteService.deleteFavourite(id, source);
  }
}
