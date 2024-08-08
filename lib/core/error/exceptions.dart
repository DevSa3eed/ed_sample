import '../util/constants.dart';


class ServerException implements Exception {
  final ErrorCode errorCode;

  ServerException(this.errorCode);
}

class CacheException implements Exception {}
