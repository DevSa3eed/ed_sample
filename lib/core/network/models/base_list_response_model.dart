library base_list_response_model;

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/beneficiary_entity.dart';
part 'base_list_response_model.g.dart';

@JsonSerializable()
class BaseListResponseModel<T> {
  @JsonKey(name: 'result')
  @_Converter()
  final List<T>? data;

  @JsonKey(name: 'msg')
  final String? message;

  BaseListResponseModel({
    this.data,
    this.message,
  });

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      print('T list is ' + T.toString());
      print('T keys is ${json.keys}');
      if(T.toString() == BeneficiaryEntity.className){
        return BeneficiaryEntity.fromJson(json) as T;
      }
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object!;
  }
}
