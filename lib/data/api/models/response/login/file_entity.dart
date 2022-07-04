import '../base_entity.dart';

class FileEntity extends BaseEntity {
  String? hashId;
  String? category;
  String? fileName;
  String? thumbnailUrl;
  String? url;

  FileEntity({
    this.hashId,
    this.category,
    this.fileName,
    this.thumbnailUrl,
    this.url,
  });

  FileEntity.fromJson(dynamic json) : super.fromJson(json) {
    hashId = json['hashId'];
    category = json['category'];
    fileName = json['fileName'];
    thumbnailUrl = json['thumbnailUrl'];
    url = json['url'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hashId': hashId,
      'category': category,
      'fileName': fileName,
      'thumbnailUrl': thumbnailUrl,
      'url': url,
    };
  }
}
