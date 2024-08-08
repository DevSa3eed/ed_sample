import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';

class TopUpEntity {
  final int id;
  final BeneficiaryEntity beneficiaryEntity;
  final num amount;

  TopUpEntity(
      {required this.id,
      required this.beneficiaryEntity,
      required this.amount});

  @override
  String toString() {
    return 'TopUpEntity{id: $id, beneficiaryEntity: $beneficiaryEntity, amount: $amount}';
  }
}
