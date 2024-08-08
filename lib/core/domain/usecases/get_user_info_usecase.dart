import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'usecase.dart';
import '../../error/failures.dart';
import '../../../features/sign_in/domain/repository/sign_in_repository.dart';

/// `GetUserInfoUseCase` is a use case responsible for fetching the current user's information.
/// It extends the `UseCase` class and is annotated with `@LazySingleton`, which means that
/// it will be lazily instantiated and only one instance will be created throughout the application.
///
/// The `GetUserInfoUseCase` class has a constructor that takes a `SignInRepository` as a parameter.
/// This repository is responsible for handling user sign-in and sign-out operations.
///
/// The `call` method is an override of the `call` method from the `UseCase` class.
/// It is an asynchronous method that takes a `NoParams` parameter and returns a `Future` that resolves to an `Either` type,
/// which can either be a `Failure` or a `UserEntity`. This method calls the `getCurrentUser` method from the `signInRepository`
/// and returns its result.
///
/// The purpose of having this `GetUserInfoUseCase` is to provide a convenient way to fetch the current user's information
/// from the `SignInRepository` in a controlled and consistent manner. It allows the rest of the application to access
/// the current user's information without having to directly interact with the `SignInRepository`.
@LazySingleton()
class GetUserInfoUseCase extends UseCase<UserEntity, NoParams> {
  final SignInRepository signInRepository;

  GetUserInfoUseCase(this.signInRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await signInRepository.getCurrentUser();
  }
}
