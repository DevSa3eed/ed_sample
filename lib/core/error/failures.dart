import '../util/constants.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ErrorCode errorCode;

  ServerFailure(this.errorCode);

  @override
  String toString() => 'ServerFailure(errorCode: $errorCode)';
}

class CacheFailure implements Failure {}
