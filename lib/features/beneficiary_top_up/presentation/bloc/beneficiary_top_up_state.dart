import 'package:built_value/built_value.dart';

import '../../../../core/domain/entity/top_up_entity.dart';
import '../../../../core/error/failures.dart';

part 'beneficiary_top_up_state.g.dart';

abstract class BeneficiaryTopUpState
    implements Built<BeneficiaryTopUpState, BeneficiaryTopUpStateBuilder> {
  BeneficiaryTopUpState._();

  factory BeneficiaryTopUpState([updates(BeneficiaryTopUpStateBuilder b)]) =
      _$BeneficiaryTopUpState;

  bool get errorAmountValidation;

  TopUpEntity? get newTopUpEntity;

  String get amount;

  List<int> get fixedAmounts;

  bool get isToppingUp;
  bool get errorToppingUp;
  bool get amountTransferred;

  Failure? get failure;

  factory BeneficiaryTopUpState.initial() {
    return BeneficiaryTopUpState((b) => b
      ..amount = ""
      ..errorAmountValidation = false
      ..amountTransferred = false
      ..isToppingUp = false
      ..errorToppingUp = false
      ..fixedAmounts = [5, 10, 20, 30, 50, 75, 100]);
  }
}
