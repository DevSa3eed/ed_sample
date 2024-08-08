import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/domain/usecases/usecase.dart';
import '../../../../../core/error/failures.dart';
import '../repository/sign_up_repository.dart';

@LazySingleton()
class ContinueAsGuestUseCase
    extends UseCase<UserEntity, ContinueAsGuestParams> {
  final SignUpRepository signUpRepository;

  ContinueAsGuestUseCase(this.signUpRepository);

  @override
  Future<Either<Failure, UserEntity>> call(ContinueAsGuestParams params) {
    return signUpRepository.continueAsGuest(params);
  }
}

class ContinueAsGuestParams {
  String phoneNumber = "";

  ContinueAsGuestParams(this.phoneNumber);
}
