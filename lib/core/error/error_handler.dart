import '../error/exceptions.dart';
import '../util/constants.dart';

class ErrorHandler {
  static bool handleRemoteError(int statusCode) {
    if (statusCode >= 200 && statusCode < 300)
      return true;
    else if (statusCode == 401)
      throw ServerException(ErrorCode.UNAUTHENTICATED);
    else if (statusCode == 422)
      throw ServerException(ErrorCode.WRONG_INPUT);
    else if (statusCode == 403) throw ServerException(ErrorCode.FORBIDDEN);
    return false;
  }
}
