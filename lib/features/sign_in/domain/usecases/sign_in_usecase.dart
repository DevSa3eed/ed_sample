import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/sign_in_repository.dart';

@LazySingleton()
class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  final SignInRepository signInRepository;

  SignInUseCase(this.signInRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
    return signInRepository.signIn(params.email, params.password);
  }
}

class SignInParams {
  String email = '';
  String password = '';

  SignInParams(this.email, this.password);

  @override
  String toString() {
    return 'SignInParams{email: $email, password: $password}';
  }
}
