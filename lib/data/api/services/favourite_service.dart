import 'dart:async';
import 'dart:convert';

import 'package:core/data/api/models/request/favourite_request.dart';
import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import 'base_service.dart';

class FavouriteService extends BaseService {

  Future<List<CoreModel>> getListFavourite(int page, int pageSize) async {
    final response = await get(sprintf(GET_FAVOURITE, [page, pageSize]));
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<void> postFavourite(FavouriteRequest favouriteRequest) async {
    final postData = jsonEncode(favouriteRequest.toJson());
    await post(POST_FAVOURITE, data: postData);
  }

  Future<void> deleteFavourite(String id, String source) async {
    return await delete(sprintf(DELETE_FAVOURITE, [id, source]));
  }
}
