class DocumentModel {
  String? type;
  String? name;

  DocumentModel({this.type, this.name});

  @override
  String toString() {
    return 'DocumentModel{type: $type, name: $name}';
  }
}
