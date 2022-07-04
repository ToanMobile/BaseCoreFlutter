import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import '../models/request/enums.dart';
import '../models/response/request/company_entity.dart';
import '../models/response/request/provinces_entity.dart';
import '../models/response/upload/upload_entity.dart';
import 'base_service.dart';

class CommonService extends BaseService {
  Future<List<UploadEntity>> uploadListImage(List<String> listImagePath, {UploadDirName? uploadDir}) async {
    Map<String, dynamic> data = {};
    for (var imagePath in listImagePath) {
      data.addAll({"files": await MultipartFile.fromFile(imagePath, filename: basenameWithoutExtension(imagePath), contentType: MediaType.parse("image/jpeg"))});
    }
    var response = await postUpload(sprintf(UPLOAD_VIN_ID, [uploadDir?.name ?? ""]), data: FormData.fromMap(data));
    return List<UploadEntity>.from(response.map((item) => UploadEntity.fromJson(item)));
  }

  Future<UploadEntity> uploadImage(String imagePath, {UploadDirName? uploadDir}) async {
    Map<String, dynamic> data = {};
    data.addAll({"file": await MultipartFile.fromFile(imagePath, filename: basenameWithoutExtension(imagePath), contentType: MediaType.parse("image/jpeg"))});
    var response = await postUpload(sprintf(UPLOAD_MEDIA, [uploadDir?.name ?? ""]), data: FormData.fromMap(data));
    return UploadEntity.fromJson(response);
  }

  Future<UploadEntity> uploadDocument(String documentPath, {UploadDirName? uploadDir}) async {
    Map<String, dynamic> data = {};
    data.addAll({"file": await MultipartFile.fromFile(documentPath, filename: basenameWithoutExtension(documentPath))});
    var response = await postUpload(sprintf(UPLOAD_DOCUMENT, [uploadDir?.name ?? ""]), data: FormData.fromMap(data));
    return UploadEntity.fromJson(response);
  }

  Future<List<ProvincesEntity>> getProvinces(int page, int pageSize) async {
    final response = await get(sprintf(GET_PROVINCES, [page, pageSize]));
    final items = List<ProvincesEntity>.from(response.map((item) => ProvincesEntity.fromJson(item)));
    return items;
  }

  Future<List<CompanyEntity>> getInsuranceCompany(int page, int pageSize) async {
    final response = await get(sprintf(GET_INSURANCE_COMPANY, [page, pageSize]));
    final items = List<CompanyEntity>.from(response.map((item) => CompanyEntity.fromJson(item)));
    return items;
  }

  Future<List<String>> getInsuranceType(int page, int pageSize) async {
    final response = await get(sprintf(GET_INSURANCE_TYPE, [page, pageSize]));
    final items = List<String>.from(response.map((item) => item.toString()));
    return items;
  }
}
