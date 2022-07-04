class HistoryModel {
  String? dateTime;
  String? content;
  String? description;

  HistoryModel({this.dateTime, this.content, this.description});

  @override
  String toString() {
    return 'HistoryModel{dateTime: $dateTime, content:$content, description: $description}';
  }
}
