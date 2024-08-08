import 'package:dio/dio.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/network/models/base_list_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/models/base_remote_datasource.dart';

abstract class MainPageRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseListResponseModel<BeneficiaryEntity>> getBeneficiaries(
      String token, String url);
}

@LazySingleton(as: MainPageRemoteDataSource)
class MainPageRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MainPageRemoteDataSource {
  MainPageRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseListResponseModel<BeneficiaryEntity>> getBeneficiaries(
      String token, String url) async {
    return BaseListResponseModel(data: []);
  }
}
