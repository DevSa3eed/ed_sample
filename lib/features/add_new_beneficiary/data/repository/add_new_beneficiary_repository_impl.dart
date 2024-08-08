import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/error/failures.dart';
import 'package:ed_sample/features/add_new_beneficiary/domain/repository/add_new_beneficiary_repository.dart';
import 'package:ed_sample/features/add_new_beneficiary/domain/usecases/add_new_beneficiary_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/models/base_local_data_source.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/util/constants.dart';
import '../datasource/add_new_beneficiary_remote_datasource.dart';

@LazySingleton(as: AddNewBeneficiaryRepository)
class AddNewBeneficiaryRepositoryImpl extends BaseRepositoryImpl
    implements AddNewBeneficiaryRepository {
  final AddNewBeneficiaryRemoteDataSource addNewBeneficiaryRemoteDataSource;

  AddNewBeneficiaryRepositoryImpl(
      {required this.addNewBeneficiaryRemoteDataSource,
      required NetworkInfo networkInfo,
      required BaseLocalDataSource baseLocalDataSource})
      : super(
            baseRemoteDataSource: addNewBeneficiaryRemoteDataSource,
            networkInfo: networkInfo,
            baseLocalDataSource: baseLocalDataSource);

  @override
  Future<Either<Failure, BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params) {
    return requestWithToken((token, url) async {
      final result = await addNewBeneficiaryRemoteDataSource.addBeneficiary(
          params, token, url);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }
}
