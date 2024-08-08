import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'usecase.dart';
import '../../error/failures.dart';
import '../../../features/sign_in/domain/repository/sign_in_repository.dart';

@LazySingleton()
class GetUserInfoUseCase extends UseCase<UserEntity, NoParams> {
  final SignInRepository signInRepository;

  GetUserInfoUseCase(this.signInRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await signInRepository.getCurrentUser();
  }
}
