import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/beneficiary_top_up_usecase.dart';
import 'beneficiary_top_up_event.dart';
import 'beneficiary_top_up_state.dart';

@Injectable()
class BeneficiaryTopUpBloc
    extends Bloc<BeneficiaryTopUpEvent, BeneficiaryTopUpState> {
  final BeneficiaryTopUpUseCase beneficiaryTopUpUseCase;
  final InputValidators inputValidators;

  BeneficiaryTopUpBloc(
      {required this.beneficiaryTopUpUseCase, required this.inputValidators})
      : super(BeneficiaryTopUpState.initial());

  void onAmountChanged(String val) {
    add(AmountChanged(val));
  }

  void onTopUpSubmit(BeneficiaryEntity beneficiaryEntity) {
    add(TopUpSubmit(beneficiaryEntity));
  }

  void onClearErrors() {
    add(ClearErrors());
  }

  Stream<BeneficiaryTopUpState> mapEventToState(
      BeneficiaryTopUpEvent event) async* {
    if (event is AmountChanged) {
      yield state.rebuild((p0) => p0
        ..amount = event.val
        ..errorAmountValidation = false);
    } else if (event is TopUpSubmit) {
      yield* mapToTopUpBeneficiary(event);
    } else if (event is ClearErrors) {
      yield state.rebuild((p0) => p0
        ..errorAmountValidation = false
        ..failure = null);
    }
  }

  Stream<BeneficiaryTopUpState> mapToTopUpBeneficiary(
      TopUpSubmit event) async* {
    if (!inputValidators.validateTopUpAmount(state.amount)) {
      yield state.rebuild((p0) => p0..errorAmountValidation = false);
    } else {
      yield* topUp(event);
    }
  }

  Stream<BeneficiaryTopUpState> topUp(TopUpSubmit event) async* {
    yield state.rebuild((p0) => p0
      ..isToppingUp = true
      ..errorToppingUp = false
      ..amountTransferred = false);
    final result = await beneficiaryTopUpUseCase(BeneficiaryTopUpParams(
        num.parse(state.amount), event.beneficiaryEntity));
    yield* result.fold((l) async* {
      yield state.rebuild((p0) => p0
        ..isToppingUp = false
        ..errorToppingUp = true
        ..failure = l
        ..amountTransferred = false);
    }, (r) async* {
      yield state.rebuild((p0) => p0
        ..isToppingUp = false
        ..errorToppingUp = false
        ..amountTransferred = true
        ..newTopUpEntity = r);
    });
  }
}
