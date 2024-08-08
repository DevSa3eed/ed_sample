import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';

abstract class MainPageRepository extends BaseRepository {
  Future<Either<Failure, List<BeneficiaryEntity>>> getBeneficiaries();
}
