import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/domain/entity/top_up_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/beneficiary_top_up_repository.dart';

@LazySingleton()
class BeneficiaryTopUpUseCase
    extends UseCase<TopUpEntity, BeneficiaryTopUpParams> {
  final BeneficiaryTopUpRepository beneficiaryTopUpRepository;

  BeneficiaryTopUpUseCase(this.beneficiaryTopUpRepository);

  @override
  Future<Either<Failure, TopUpEntity>> call(
      BeneficiaryTopUpParams params) async {
    return await beneficiaryTopUpRepository.topUp(params);
  }
}

class BeneficiaryTopUpParams {
  num amount = 0.0;
  BeneficiaryEntity beneficiaryEntity;

  BeneficiaryTopUpParams(this.amount, this.beneficiaryEntity);
}
