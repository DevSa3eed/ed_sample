import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/add_new_beneficiary_repository.dart';

@LazySingleton()
class AddNewBeneficiaryUseCase
    extends UseCase<BeneficiaryEntity, SubmitNewBeneficiaryParams> {
  final AddNewBeneficiaryRepository addNewBeneficiaryRepository;

  AddNewBeneficiaryUseCase(this.addNewBeneficiaryRepository);

  @override
  Future<Either<Failure, BeneficiaryEntity>> call(
      SubmitNewBeneficiaryParams params) async {
    return await addNewBeneficiaryRepository.addBeneficiary(params);
  }
}

class SubmitNewBeneficiaryParams {
  String phoneNumber = "";
  String nickname = "";

  SubmitNewBeneficiaryParams(
      {required this.phoneNumber, required this.nickname});
}
