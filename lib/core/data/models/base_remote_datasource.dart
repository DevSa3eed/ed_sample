import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/logout.dart';
import '../../error/error_handler.dart';
import '../../error/exceptions.dart';
import '../../network/models/base_list_response_model.dart';
import '../../network/models/base_response_model.dart';
import '../../util/constants.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<T> performPutRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequest<T>(
    String endpoint,
    FormData? data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequestJSON<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  Future<BaseResponseModel<T>> performPostRequest<T>(
    String endpoint,
    dynamic data, {
    String token = '',
  });

  Future<BaseListResponseModel<T>> performPostRequestList<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  Future<List<String>> performPostRequestX(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  @protected
  Future<List<T>> performGetListRequest<T>(
    String endpoint, {
    String token = '',
  });

  @protected
  Future<T> performGetRequest<T>(
    String endpoint, {
    String token = '',
  });

  Future<BaseResponseModel<bool>> logout(
      String token, String url, LogOutParams params);
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<T> performGetRequest<T>(
    String endpoint, {
    String token = '',
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response status code is ${response.statusCode}');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse.data != null)
          return baseResponse.data!;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioException) {
        if (e.response?.statusCode == 477) {
          throw ServerException(ErrorCode.SERVER_ERROR);
        } else {
          ErrorHandler.handleRemoteError(e.response!.statusCode ?? 404);
          throw e;
        }
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<List<T>> performGetListRequest<T>(
    String endpoint, {
    String token = '',
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        print('base is ${baseResponse.data}');
        if (baseResponse.data != null)
          return baseResponse.data!;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('get list e is $e');
      if (e is ServerException) {
        print(e.errorCode);
        throw e;
      }
      if (e is DioException) {
        print('e is DioError');
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<BaseResponseModel<T>> performPostRequest<T>(
      String endpoint, dynamic data,
      {String token = ''}) async {
    print('endpoints  is $endpoint');
    print('data  is $data');
    print('token  is $token');
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        if (T.toString() == 'String') {
          return BaseResponseModel<T>(data: 'Success' as T);
        }
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        print('the token is ${baseResponse.token}');
        if (baseResponse.data != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('eee is $e');
      if (e is ServerException) throw e;
      if (e is DioException) {
        if (e.response?.statusCode == 419 || e.response?.statusCode == 477) {
        } else
          ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPutRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse.data != null)
          return baseResponse.data!;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioException) {
        if (e.response?.statusCode == 419 || e.response?.statusCode == 477) {
        } else
          ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPatchRequest<T>(
    String endpoint,
    FormData? data, {
    String token = '',
  }) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        if (T.toString() == 'String') {
          return 'Success' as T;
        }
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse.data != null)
          return baseResponse.data!;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) {
        throw e;
      }
      if (e is DioException) {
        if (e.response?.statusCode == 419 || e.response?.statusCode == 477) {
        } else
          ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPatchRequestJSON<T>(
    String endpoint,
    Map<String, dynamic>? data, {
    String token = '',
  }) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse.data != null)
          return baseResponse.data!;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioException) {
        if (e.response?.statusCode == 419 || e.response?.statusCode == 477) {
        } else
          ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<List<String>> performPostRequestX(
      String endpoint, Map<String, dynamic> data,
      {String token = ''}) async {
    {
      try {
        Dio dio2 = Dio(
          BaseOptions(
            connectTimeout: Duration(seconds: 2),
            responseType: ResponseType.plain,
          ),
        );

        final response = await dio2.post(endpoint,
            data: {"refreshToken": token},
            options: Options(contentType: Headers.formUrlEncodedContentType));

        if (response.statusCode == 200) {
          print(200);
          print(response.data.runtimeType);
          final js = json.decode(response.data);
          final res = js['data'];
          print(data);
          return [res['token'], res['refreshToken']];
        } else {
          print('error from postX');
          throw ServerException(ErrorCode.UNAUTHENTICATED);
        }
      } catch (e) {
        print(e);
        if (e is ServerException)
          throw e;
        else if (e is DioException) {
          print('dio aaa');
          throw e;
        } else
          throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<BaseListResponseModel<T>> performPostRequestList<T>(
      String endpoint, Map<String, dynamic> data,
      {String token = ''}) async {
    print('endpoints  is $endpoint');
    print('data  is $data');
    print('token  is $token');
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        if (T.toString() == 'String') {
          return BaseListResponseModel<T>(data: 'Success' as List<T>);
        }
        final baseResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse.data != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('eee is $e');
      if (e is ServerException) throw e;
      if (e is DioException) {
        if (e.response?.statusCode == 419 || e.response?.statusCode == 477) {
        } else
          ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<BaseResponseModel<bool>> logout(
      String token, String url, LogOutParams params) async {
    return BaseResponseModel(data: true);
  }
}
