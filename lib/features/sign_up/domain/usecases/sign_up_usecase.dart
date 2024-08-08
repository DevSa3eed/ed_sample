import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/domain/usecases/usecase.dart';
import '../../../../../core/error/failures.dart';
import '../repository/sign_up_repository.dart';

@LazySingleton()
class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) {
    return signUpRepository.signUp(params);
  }
}

class SignUpParams {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String phoneNumber = '';

  SignUpParams({
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() => {
        "username": email,
        "phone_number": phoneNumber,
        "password": password,
        "password_confirmation": confirmPassword,
      };
}
