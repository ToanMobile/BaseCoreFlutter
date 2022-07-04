/// category : "other"
/// fileName : "a8113425-bbcd-4ee5-a2b2-99e0f3e3cd3b.png"
/// hashId : "7nJD4QrWam"
/// thumbnailUrl : "https://tradein-api-dev.itads.io/thumbnail/a8113425-bbcd-4ee5-a2b2-99e0f3e3cd3b.png"
/// url : "https://tradein-api-dev.itads.io/files/7nJD4QrWam?auth=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNjUwOTQ1MzM0LCJleHAiOjE2NTA5NDYyMzR9.1qsEq0PdDE7XQUaWBaIkyKk3tvRQWwkEc7avoxkK-2I"

class UploadEntity {
  UploadEntity({
    String? category,
    String? fileName,
    String? realFileName,
    String? hashId,
    String? thumbnailUrl,
    String? url,
  }) {
    _category = category;
    _fileName = fileName;
    _realFileName = realFileName;
    _hashId = hashId;
    _thumbnailUrl = thumbnailUrl;
    _url = url;
  }

  UploadEntity.fromJson(dynamic json) {
    _category = json['category'];
    _fileName = json['fileName'];
    _realFileName = json['realFileName'];
    _hashId = json['hashId'];
    _thumbnailUrl = json['thumbnailUrl'];
    _url = json['url'];
  }

  String? _category;
  String? _fileName;
  String? _realFileName;
  String? _hashId;
  String? _thumbnailUrl;
  String? _url;

  String? get category => _category;

  String? get fileName => _fileName;

  String? get realFileName => _realFileName;

  String? get hashId => _hashId;

  String? get thumbnailUrl => _thumbnailUrl;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = _category;
    map['fileName'] = _fileName;
    map['realFileName'] = _realFileName;
    map['hashId'] = _hashId;
    map['thumbnailUrl'] = _thumbnailUrl;
    map['url'] = _url;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '');
    return map;
  }
}
