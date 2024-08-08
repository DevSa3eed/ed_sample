import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/add_new_beneficiary_usecase.dart';
import 'add_new_beneficiary_event.dart';
import 'add_new_beneficiary_state.dart';

@Injectable()
class AddNewBeneficiaryBloc
    extends Bloc<AddNewBeneficiaryEvent, AddNewBeneficiaryState> {
  final AddNewBeneficiaryUseCase addNewBeneficiaryUseCase;
  final InputValidators inputValidators;

  AddNewBeneficiaryBloc(
      {required this.addNewBeneficiaryUseCase, required this.inputValidators})
      : super(AddNewBeneficiaryState.initial());

  void onAddBeneficiary() {
    add(AddBeneficiary());
  }

  void onPhoneNumberChanged(String val) {
    add(PhoneNumberChanged(val));
  }

  void onNicknameChanged(String val) {
    add(NicknameChanged(val));
  }

  Stream<AddNewBeneficiaryState> mapEventToState(
      AddNewBeneficiaryEvent event) async* {
    if (event is PhoneNumberChanged) {
      yield state.rebuild((p0) => p0
        ..errorPhoneNumberValidation = false
        ..submitNewBeneficiaryParams!.phoneNumber = event.val);
    } else if (event is NicknameChanged) {
      yield state.rebuild((p0) => p0
        ..errorNicknameValidation = false
        ..submitNewBeneficiaryParams!.nickname = event.val);
    } else if (event is AddBeneficiary) {
      yield* mapToAddBeneficiary(event);
    }
  }

  Stream<AddNewBeneficiaryState> mapToAddBeneficiary(
      AddBeneficiary event) async* {
    if (state.submitNewBeneficiaryParams.nickname.length > 20 ||
        state.submitNewBeneficiaryParams.nickname.length < 5) {
      yield state.rebuild((p0) => p0..errorNicknameValidation = true);
    } else if (!inputValidators
        .validateUAEPhoneInput(state.submitNewBeneficiaryParams.phoneNumber)) {
      yield state.rebuild((p0) => p0..errorPhoneNumberValidation = true);
    } else {
      yield* addNewBeneficiary();
    }
  }

  Stream<AddNewBeneficiaryState> addNewBeneficiary() async* {
    yield state.rebuild((p0) => p0
      ..isAddingBeneficiary = true
      ..errorAddingBeneficiary = false
      ..beneficiaryAdded = false);
    final result =
        await addNewBeneficiaryUseCase(state.submitNewBeneficiaryParams);
    yield* result.fold((l) async* {
      yield state.rebuild((p0) => p0
        ..isAddingBeneficiary = false
        ..errorAddingBeneficiary = true
        ..beneficiaryAdded = false);
    }, (r) async* {
      yield state.rebuild((p0) => p0
        ..isAddingBeneficiary = false
        ..errorAddingBeneficiary = false
        ..beneficiaryAdded = true
        ..newBeneficiary = r);
    });
  }
}
