/// createdAt : "2022-06-03T09:34:21.320Z"
/// updatedAt : "2022-06-03T09:34:21.320Z"
/// type : "vehicle-ownership"
/// description : "038fd9c7-c4fa-4ab9-a589-8f582eddc7d2"
/// file : {"category":"other","fileName":"038fd9c7-c4fa-4ab9-a589-8f582eddc7d2","hashId":"4w3r1GlXKb","thumbnailUrl":"","url":"https://tradein-api-dev.itads.io/files/4w3r1GlXKb?auth=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAzNywiaWF0IjoxNjU0MjQ4OTMyLCJleHAiOjE2NTQyNDk4MzJ9.NrQWRwUWksMrUA53abO5WBriRiCuATvjH7Tjfkdf3iE","realFileName":"hangouts_incoming_message"}
/// notes : []
/// hashId : "g3YwEn5DKo"

class DocumentsEntity {
  DocumentsEntity({
    this.createdAt,
    this.updatedAt,
    this.type,
    this.description,
    this.realFileName,
    this.file,
    this.hashId,
    this.hashFileId,
  });

  DocumentsEntity.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    type = json['type'];
    description = json['description'];
    realFileName = json['realFileName'];
    file = json['file'] != null ? FileEntity.fromJson(json['file']) : null;
    hashId = json['hashId'];
    hashFileId = json['hashFileId'];
  }

  String? createdAt;
  String? updatedAt;
  String? type;
  String? description;
  String? realFileName;
  FileEntity? file;
  String? hashFileId;
  String? hashId;

  @override
  String toString() {
    return 'DocumentsEntity{createdAt: $createdAt, updatedAt: $updatedAt, type: $type, description: $description, realFileName: $realFileName, file: $file, hashFileId: $hashFileId, hashId: $hashId}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['type'] = type;
    map['description'] = description;
    map['realFileName'] = realFileName;
    if (file != null) {
      map['file'] = file?.toJson();
    }
    map['hashId'] = hashId;
    map['hashFileId'] = hashFileId;
    map.removeWhere((dynamic key, dynamic value) => key == null || value == null || value == '' || value == []);
    return map;
  }
}

/// category : "other"
/// fileName : "038fd9c7-c4fa-4ab9-a589-8f582eddc7d2"
/// hashId : "4w3r1GlXKb"
/// thumbnailUrl : ""
/// url : "https://tradein-api-dev.itads.io/files/4w3r1GlXKb?auth=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAzNywiaWF0IjoxNjU0MjQ4OTMyLCJleHAiOjE2NTQyNDk4MzJ9.NrQWRwUWksMrUA53abO5WBriRiCuATvjH7Tjfkdf3iE"
/// realFileName : "hangouts_incoming_message"

class FileEntity {
  FileEntity({
    this.category,
    this.fileName,
    this.hashId,
    this.thumbnailUrl,
    this.url,
    this.realFileName,
  });

  FileEntity.fromJson(dynamic json) {
    category = json['category'];
    fileName = json['fileName'];
    hashId = json['hashId'];
    thumbnailUrl = json['thumbnailUrl'];
    url = json['url'];
    realFileName = json['realFileName'];
  }

  String? category;
  String? fileName;
  String? hashId;
  String? thumbnailUrl;
  String? url;
  String? realFileName;

  @override
  String toString() {
    return 'FileEntity{category: $category, fileName: $fileName, hashId: $hashId, realFileName: $realFileName}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['fileName'] = fileName;
    map['hashId'] = hashId;
    map['thumbnailUrl'] = thumbnailUrl;
    map['url'] = url;
    map['realFileName'] = realFileName;
    return map;
  }
}
