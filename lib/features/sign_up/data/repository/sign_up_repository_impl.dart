import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:ed_sample/features/sign_up/domain/usecases/continue_as_guest_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/util/constants.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/sign_up_repository.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../datasource/sign_up_local_datasource.dart';
import '../datasource/sign_up_remote_datasource.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl extends BaseRepositoryImpl
    implements SignUpRepository {
  final SignUpRemoteDataSource signUpRemoteDataSource;
  final SignUpLocalDataSource signUpLocalDataSource;
  final NetworkInfo networkInfo;

  SignUpRepositoryImpl({
    required this.signUpRemoteDataSource,
    required this.signUpLocalDataSource,
    required this.networkInfo,
  }) : super(
            baseRemoteDataSource: signUpRemoteDataSource,
            baseLocalDataSource: signUpLocalDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params) async {
    final result = await signUpRemoteDataSource.signUp(params);
    if (result.data == null) {
      return Left(ServerFailure(ErrorCode.SERVER_ERROR));
    } else {
      return Right(result.data!);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> continueAsGuest(
      ContinueAsGuestParams params) async {
    final result = await signUpRemoteDataSource.continueAsGuest(params);
    if (result.data == null) {
      return Left(ServerFailure(ErrorCode.SERVER_ERROR));
    } else {
      return Right(result.data!);
    }
  }
}
