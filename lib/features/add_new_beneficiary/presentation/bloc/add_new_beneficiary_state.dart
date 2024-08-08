import 'package:built_value/built_value.dart';

import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../domain/usecases/add_new_beneficiary_usecase.dart';

part 'add_new_beneficiary_state.g.dart';

abstract class AddNewBeneficiaryState
    implements Built<AddNewBeneficiaryState, AddNewBeneficiaryStateBuilder> {
  AddNewBeneficiaryState._();

  factory AddNewBeneficiaryState([updates(AddNewBeneficiaryStateBuilder b)]) =
      _$AddNewBeneficiaryState;

  bool get errorPhoneNumberValidation;
  bool get errorNicknameValidation;

  SubmitNewBeneficiaryParams get submitNewBeneficiaryParams;

  bool get isAddingBeneficiary;
  bool get errorAddingBeneficiary;
  bool get beneficiaryAdded;
  BeneficiaryEntity? get newBeneficiary;

  factory AddNewBeneficiaryState.initial() {
    return AddNewBeneficiaryState((b) => b
      ..errorPhoneNumberValidation = false
      ..errorNicknameValidation = false
      ..isAddingBeneficiary = false
      ..errorAddingBeneficiary = false
      ..beneficiaryAdded = false
      ..submitNewBeneficiaryParams =
          SubmitNewBeneficiaryParams(phoneNumber: "", nickname: ""));
  }
}
