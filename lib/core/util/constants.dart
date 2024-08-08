import 'package:dio/dio.dart';

class Endpoints {
  static const BASE_URL = 'http://domain.com';

  static const SIGN_IN = '/api/sign-in';
  static const REGISTER = '/api/register';
  static const GET_BENEFICIARIES = '/api/beneficiaries';
  static const ADD_BENEFICIARY = '/api/add-beneficiary';
  static const TOP_UP = '/api/top-up';
}

enum ErrorCode {
  CacheError,
  UNAUTHENTICATED,
  WRONG_INPUT,
  FORBIDDEN,
  PARSE_ERROR,
  NO_INTERNET_CONNECTION,
  TIMEOUT,
  SERVER_ERROR,
  EXIST,
  NOT_EXIST_ACCOUNT,
  ERROR_ADD_BENEFICIARY,
  INSUFFICIENT_BALANCE
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String token, {String language = ''}) {
    if (token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
        'Accept-Language': language,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': language,
      };
    }
    return options;
  }
}
