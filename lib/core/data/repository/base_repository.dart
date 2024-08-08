import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/logout.dart';
import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../../network/network_info.dart';
import '../../util/constants.dart';
import '../models/base_local_data_source.dart';
import '../models/base_remote_datasource.dart';
import '../../domain/entity/user_entity.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();
typedef FutureEitherOrWithToken<T> = Future<Either<Failure, T>> Function(
  String token,
  String url,
);

abstract class BaseRepository {
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);

  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, bool>> logOutUser(LogOutParams params);

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, UserEntity>> saveUserInfo(UserEntity userEntity);

  Future<Either<Failure, T>> requestWithToken<T>(
      FutureEitherOrWithToken<T> body);
}

/// [BaseRepositoryImpl] is the implementation of the [BaseRepository] interface
/// each repository must extend this class and implement a sub-interface of [BaseRepository] interface.

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final NetworkInfo networkInfo;
  final BaseRemoteDataSource? baseRemoteDataSource;

  BaseRepositoryImpl({
    required this.baseLocalDataSource,
    required this.networkInfo,
    this.baseRemoteDataSource,
  });

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    // if (await networkInfo.isConnected) {
    return body();
    /*} else {
      return Left(ServerFailure(ErrorCode.NO_INTERNET_CONNECTION));
    }*/
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await baseLocalDataSource.token;

    print("token ===> $token");
    if (token != null && token.isNotEmpty) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, T>> requestWithToken<T>(
    FutureEitherOrWithToken<T> body,
  ) async {
    return await checkNetwork<T>(() async {
      try {
        final token = await getToken();
        final url = await baseLocalDataSource.url;
        print('token is $token');
        return await token.fold(
          (failure) => body('', url),
          (token) async {
            return body(token, url);
          },
        );
      } catch (e) {
        if (e is ServerException) {
          return Left(ServerFailure(e.errorCode));
        } else {
          print(e);
          return Left(ServerFailure(ErrorCode.TIMEOUT));
        }
      }
    });
  }

  @override
  Future<Either<Failure, bool>> logOutUser(LogOutParams params) async {
    return requestWithToken((token, url) async {
      await baseLocalDataSource.logOutUser(params);
      final result =
          await baseRemoteDataSource!.logout("Bearer " + token, url, params);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(true);
      }
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final user = baseLocalDataSource.user;
    if (user?.isNotEmpty ?? false) {
      return Right(UserEntity.fromJson(json.decode(user!)));
    } else
      return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, UserEntity>> saveUserInfo(
      UserEntity userEntity) async {
    final user = await baseLocalDataSource.saveUserInfo(userEntity);
    return Right(user);
  }
}
