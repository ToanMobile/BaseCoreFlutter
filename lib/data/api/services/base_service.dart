import 'dart:convert';

import 'package:core/data/api/exceptions/data_exception.dart';
import 'package:core/data/api/models/response/api_response.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared/libraries/logger/flutter_logger.dart';

import '../rest_client.dart';

enum JsonType { FULL_RESPONSE, JSON_RESPONSE, BODY_BYTES, STRING_RESPONSE }

abstract class BaseService {
  Future<dynamic> get(String path, {Map<String, dynamic>? params, JsonType responseType = JsonType.JSON_RESPONSE}) async {
    final response = await RestClient.getDio().get(path, queryParameters: params);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> post(String path, {data, bool enableCache = false, JsonType responseType = JsonType.JSON_RESPONSE}) async {
    final response = await RestClient.getDio().post(path, data: data);
    Logger.e("BaseService::"+ response.toString());
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> put(String path, {data, JsonType responseType = JsonType.JSON_RESPONSE}) async {
    final response = await RestClient.getDio().put(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> delete(String path, {data, JsonType responseType = JsonType.JSON_RESPONSE}) async {
    final response = await RestClient.getDio().delete(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> postUpload(String path, {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio(isUpload: true).post(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  bool isSuccess(statusCode) => statusCode! >= 200 && statusCode! <= 299;

  dynamic _handleResponse(dio.Response response, {JsonType responseType = JsonType.JSON_RESPONSE}) {
    if (isSuccess(response.statusCode)) {
      if (responseType == JsonType.JSON_RESPONSE) {
        return ApiResponse.fromJson(response.data).data;
      } else if (responseType == JsonType.FULL_RESPONSE) {
        return response.data;
      } else if (responseType == JsonType.STRING_RESPONSE) {
        return ApiResponse(statusCode: response.statusCode, message: response.data, error: response.data);
      } else if (responseType == JsonType.BODY_BYTES) {
        return ApiResponse(statusCode: response.statusCode, message: response.data, error: response.data);
      } else {
        throw DataException.fromJson(jsonDecode(response.data));
      }
    } else {
      throw DataException.fromJson(jsonDecode(response.data));
    }
  }

  String queryParam(String? id) {
    Map<String, String?> queryParams = {'status': 'ACTIVE', 'root': id};
    return jsonEncode(queryParams);
  }
}
