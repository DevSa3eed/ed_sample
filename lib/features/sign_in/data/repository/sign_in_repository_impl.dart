import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/util/constants.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/sign_in_repository.dart';
import '../datasource/sign_in_local_datasource.dart';
import '../datasource/sign_in_remote_datasource.dart';

@LazySingleton(as: SignInRepository)
class DealerSignInRepositoryImpl extends BaseRepositoryImpl
    implements SignInRepository {
  final SignInRemoteDataSource signInRemoteDataSource;
  final SignInLocalDataSource signInLocalDataSource;
  final NetworkInfo networkInfo;

  DealerSignInRepositoryImpl({
    required this.signInRemoteDataSource,
    required this.signInLocalDataSource,
    required this.networkInfo,
  }) : super(
            baseRemoteDataSource: signInRemoteDataSource,
            baseLocalDataSource: signInLocalDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, UserEntity>> signIn(
      String name, String password) async {
    final result = await signInRemoteDataSource.login(name, password);
    if (result.data == null) {
      if (result.message == "Invalid Input") {
        return Left(ServerFailure(ErrorCode.NOT_EXIST_ACCOUNT));
      } else {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      }
    } else {
      return Right(result.data!);
    }
  }
}
