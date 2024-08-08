import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/models/base_remote_datasource.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/splash_repository.dart';
import '../datasource/splash_local_datasource.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl extends BaseRepositoryImpl
    implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;

  SplashRepositoryImpl(
      {required this.splashLocalDataSource,
        required NetworkInfo networkInfo,
        required BaseRemoteDataSource baseRemoteDataSource})
      : super(
      baseLocalDataSource: splashLocalDataSource,
      networkInfo: networkInfo,
      baseRemoteDataSource: baseRemoteDataSource);

  @override
  Future<Either<Failure, int>> checkUserStatus() async {
    int? userStatus = await splashLocalDataSource.getUserStatus();
    if(userStatus == null)
      return Left(CacheFailure());
    return Right(userStatus);
  }
}