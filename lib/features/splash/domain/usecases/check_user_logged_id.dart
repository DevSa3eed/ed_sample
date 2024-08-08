import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/splash_repository.dart';

@LazySingleton()
class CheckUserIsLoggedIn extends UseCase<int, NoParams>{
  final SplashRepository splashRepo;

  CheckUserIsLoggedIn(this.splashRepo);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await splashRepo.checkUserStatus();
  }

}