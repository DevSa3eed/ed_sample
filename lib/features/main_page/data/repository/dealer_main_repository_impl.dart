import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/constants.dart';
import '../../domain/repository/dealer_main_repository.dart';
import '../datasource/main_page_local_datasource.dart';
import '../datasource/main_page_remote_datasource.dart';

@LazySingleton(as: MainPageRepository)
class MainPageRepositoryImpl extends BaseRepositoryImpl
    implements MainPageRepository {
  final MainPageRemoteDataSource dealerMainRemoteDataSource;
  final MainPageLocalDataSource dealerMainLocalDataSource;
  final NetworkInfo networkInfo;

  MainPageRepositoryImpl({
    required this.dealerMainRemoteDataSource,
    required this.dealerMainLocalDataSource,
    required this.networkInfo,
  }) : super(
            baseRemoteDataSource: dealerMainRemoteDataSource,
            baseLocalDataSource: dealerMainLocalDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, List<BeneficiaryEntity>>> getBeneficiaries() {
    return requestWithToken((token, url) async {
      final result = await dealerMainRemoteDataSource.getBeneficiaries(
          "Bearer " + token, url);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }
}
