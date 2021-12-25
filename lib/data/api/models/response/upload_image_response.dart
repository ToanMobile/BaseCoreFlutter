import 'package:core/data/api/models/response/home/core_model.dart';

class UploadImageResponse {
  UploadImageResponse({
    String? uploadedUrl,
    String? executedScript,
    List<CoreModel>? item,
  }) {
    _uploadedUrl = uploadedUrl;
    _executedScript = executedScript;
    _item = item;
  }

  UploadImageResponse.fromJson(dynamic json) {
    _uploadedUrl = json['uploadedUrl'];
    _executedScript = json['executedScript'];
    if (json['colors'] != null) {
      _item = [];
      json['colors'].forEach((v) {
        _item?.add(CoreModel.fromJson(v));
      });
    }
  }

  String? _uploadedUrl;
  String? _executedScript;
  List<CoreModel>? _item;

  String? get uploadedUrl => _uploadedUrl;

  String? get executedScript => _executedScript;

  List<CoreModel>? get item => _item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uploadedUrl'] = _uploadedUrl;
    map['executedScript'] = _executedScript;
    if (_item != null) {
      map['item'] = _item?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
