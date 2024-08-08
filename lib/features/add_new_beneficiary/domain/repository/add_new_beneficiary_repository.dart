import 'package:dartz/dartz.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../../../core/error/failures.dart';
import '../usecases/add_new_beneficiary_usecase.dart';

abstract class AddNewBeneficiaryRepository extends BaseRepository {
  Future<Either<Failure, BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params);
}
