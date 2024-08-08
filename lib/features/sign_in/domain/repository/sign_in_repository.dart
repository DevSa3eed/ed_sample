import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/error/failures.dart';

abstract class SignInRepository extends BaseRepository {
  Future<Either<Failure, UserEntity>> signIn(String name, String password);
}
