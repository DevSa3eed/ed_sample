class ErrorEntity {
  static String className = "ErrorEntity";

  final String errorCode;
  final String message;

  ErrorEntity({required this.errorCode, required this.message});

  factory ErrorEntity.fromJson(Map<String, dynamic> json) {
    return ErrorEntity(
        errorCode: json['code'].toString(), message: json['msg']);
  }

  @override
  String toString() => 'ErrorEntity(errorCode: $errorCode, message: $message)';
}
