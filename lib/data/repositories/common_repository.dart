import 'package:core/data/api/models/request/enums.dart';
import 'package:core/data/api/models/response/upload_image_response.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:core/data/api/services/common_service.dart';
import 'package:core/data/storage/app_storage.dart';
import 'package:get/get.dart';

import 'base_repository.dart';

class CommonRepository extends BaseRepository {
  final _commonService = Get.find<CommonService>();
  final storage = Get.find<AppStorage>();

  Future<UploadImageResponse?> uploadImage(String imagePath, {UploadDirName? uploadDir, int retries = 2}) async {
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

  Future<UserInfo?> getMyUserInfo() async {
    return await storage.getUserInfo();
  }

  Future<void> logOut() async {
    await storage.logout();
  }
}
