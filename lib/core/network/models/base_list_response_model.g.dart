// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
        Map<String, dynamic> json) =>
    BaseListResponseModel<T>(
      data: (json['result'] as List<dynamic>?)
          ?.map((e) => _Converter<T>().fromJson(e as Object))
          .toList(),
      message: json['msg'] as String?,
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'result': instance.data?.map(_Converter<T>().toJson).toList(),
      'msg': instance.message,
    };
