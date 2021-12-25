class DataException implements Exception {
  final int? statusCode;
  final String? status;
  final String? message;
  final dynamic error;

  DataException({this.statusCode, this.status, this.message, this.error});

  factory DataException.fromJson(Map<String, dynamic> json) => DataException(
      statusCode: json.containsKey("statusCode") ? json["statusCode"] : 0,
      status: json.containsKey("status") ? json["status"] : null,
      message: json.containsKey("message") ? json["message"] : null,
      error: json.containsKey("error") ? json["error"] : null);

  @override
  String toString() {
    return 'DataException{statusCode: $statusCode, status: $status, message: $message, error: $error}';
  }
}
