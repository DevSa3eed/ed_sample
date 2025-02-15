import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/data/repository/base_repository.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'usecase.dart';
import '../../error/failures.dart';

@LazySingleton()
class SaveUserInfoUseCase extends UseCase<UserEntity, UserEntity> {
  final BaseRepository baseRepository;

  SaveUserInfoUseCase(this.baseRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity userEntity) async {
    return await baseRepository.saveUserInfo(userEntity);
  }
}
