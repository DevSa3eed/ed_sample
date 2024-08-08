// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseModel<T>(
      code: json['code'] as String?,
      data: _dataFromJson(json['result']),
      refreshToken: json['refresh_token'] as String?,
      token: json['token'] as String?,
      message: json['msg'] as String?,
    );

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': _$nullableGenericToJson(instance.data, toJsonT),
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'msg': instance.message,
      'code': instance.code,
    };

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
