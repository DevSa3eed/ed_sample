import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/features/main_page/domain/repository/dealer_main_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';

@LazySingleton()
class GetBeneficiariesUseCase
    extends UseCase<List<BeneficiaryEntity>, NoParams> {
  final MainPageRepository mainPageRepository;

  GetBeneficiariesUseCase(this.mainPageRepository);

  @override
  Future<Either<Failure, List<BeneficiaryEntity>>> call(NoParams params) async {
    return await mainPageRepository.getBeneficiaries();
  }
}
