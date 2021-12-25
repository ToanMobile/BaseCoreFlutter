import 'package:core/data/api/models/request/enums.dart';
import 'package:core/data/api/models/response/upload_image_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import 'base_service.dart';

class CommonService extends BaseService {
  Future<UploadImageResponse> uploadImage(String? imagePath, {UploadDirName? uploadDir}) async {
    Map<String, dynamic> data = {};
    if (imagePath != null) {
      data["image"] = await MultipartFile.fromFile(imagePath, filename: basename(imagePath), contentType: MediaType.parse("image/jpeg"));
    }
    var response = await postUpload(sprintf(UPLOAD_IMAGE, [uploadDir?.name ?? ""]), data: FormData.fromMap(data));
    return UploadImageResponse.fromJson(response);
  }
}
