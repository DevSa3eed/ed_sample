library base_response_model;

import 'package:json_annotation/json_annotation.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/util/constants.dart';
import '../../domain/entity/user_entity.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  @JsonKey(fromJson: _dataFromJson, name: 'result')
  final T? data;

  @JsonKey(
    name: 'token',
  )
  final String? token;

  @JsonKey(
    name: 'refresh_token',
  )
  final String? refreshToken;

  @JsonKey(
    name: 'msg',
  )
  String? message;

  String? code;

  BaseResponseModel(
      {this.code, this.data, this.refreshToken, this.token, this.message});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson<T>(json, _dataFromJson);

  @override
  String toString() {
    return 'BaseResponseModel(data: $data, token: $token, refreshToken: $refreshToken, message: $message, code: $code)';
  }
}

T _dataFromJson<T>(dynamic result) {
  print('T is ${T.toString()}');
  final name = T.toString().substring(0, T.toString().length - 1);
  print('T name is $name');
  print('daataaaa');
  print(result);
  try {
    if (result is Map<String, dynamic>) {
      if (name == UserEntity.className) {
        return UserEntity.fromJson(result) as T;
      }
    }
    if (name == 'String') {
      return "Success" as T;
    }
    if (name == 'Nul') {
      return null as T;
    }

    throw ServerException(ErrorCode.PARSE_ERROR);
  } catch (e) {
    print('parses error is $e');
    throw ServerException(ErrorCode.PARSE_ERROR);
  }
}
