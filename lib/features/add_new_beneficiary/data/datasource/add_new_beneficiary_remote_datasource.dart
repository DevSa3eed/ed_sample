import 'package:dio/dio.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/models/base_remote_datasource.dart';
import '../../../../core/network/models/base_response_model.dart';
import '../../domain/usecases/add_new_beneficiary_usecase.dart';

abstract class AddNewBeneficiaryRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params, String? token, String url);
}

@LazySingleton(as: AddNewBeneficiaryRemoteDataSource)
class AddNewBeneficiaryRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AddNewBeneficiaryRemoteDataSource {
  AddNewBeneficiaryRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseResponseModel<BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params, String? token, String url) async {
    return BaseResponseModel(
        data: BeneficiaryEntity(
            phoneNumber: "+971" + params.phoneNumber,
            nickName: params.nickname,
            id: 1));
  }
}
