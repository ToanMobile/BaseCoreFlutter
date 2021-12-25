enum UploadDirName { post, avatar, background}

extension UploadDirNameExt on UploadDirName {
  String get name {
    switch (this) {
      case UploadDirName.post:
        return "post";
      case UploadDirName.avatar:
        return "avatar";
      case UploadDirName.background:
        return "background";
      default:
        return "";
    }
  }
}
