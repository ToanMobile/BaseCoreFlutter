import 'package:get/get.dart';

import '../../data/api/models/request/enums.dart';
import '../../data/api/models/response/login/user_entity.dart';
import '../../data/api/models/response/request/provinces_entity.dart';
import '../../data/api/models/response/upload/upload_entity.dart';
import '../../data/api/services/common_service.dart';
import '../../data/storage/app_storage.dart';
import '../../share/constant/constant.dart';
import '../api/models/response/request/company_entity.dart';
import 'base_repository.dart';

class CommonRepository extends BaseRepository {
  final _commonService = Get.find<CommonService>();
  final storage = Get.find<AppStorage>();

  Future<List<UploadEntity>?> uploadListImage(List<String> imagePath, {UploadDirName? uploadDir, int retries = 2}) async {
    try {
      return _commonService.uploadListImage(imagePath, uploadDir: uploadDir);
    } catch (e) {
      if (retries > 0) {
        retries--;
        return _commonService.uploadListImage(imagePath, uploadDir: uploadDir);
      }
    }
    return null;
  }

  Future<UploadEntity?> uploadImage(String imagePath, {UploadDirName? uploadDir, int retries = 2}) async {
    try {
      return _commonService.uploadImage(imagePath, uploadDir: uploadDir);
    } catch (e) {
      if (retries > 0) {
        retries--;
        return _commonService.uploadImage(imagePath, uploadDir: uploadDir);
      }
    }
    return null;
  }

  Future<UploadEntity?> uploadDocument(String documentPath, {UploadDirName? uploadDir, int retries = 2}) async {
    try {
      return _commonService.uploadDocument(documentPath, uploadDir: uploadDir);
    } catch (e) {
      if (retries > 0) {
        retries--;
        return _commonService.uploadDocument(documentPath, uploadDir: uploadDir);
      }
    }
    return null;
  }

  Future<List<CompanyEntity>> getInsuranceCompany({int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _commonService.getInsuranceCompany(page, pageSize);
    return response;
  }

  Future<List<String>> getInsuranceType({int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _commonService.getInsuranceType(page, pageSize);
    return response;
  }

  Future<List<ProvincesEntity>> getProvinces({int page = PAGE, int pageSize = PAGE_SIZE}) async {
    final response = await _commonService.getProvinces(page, pageSize);
    return response;
  }

  Future<UserEntity?> getMyUserInfo() async {
    return await storage.getUserInfo();
  }

  Future<void> logOut() async {
    await storage.logout();
  }
}
