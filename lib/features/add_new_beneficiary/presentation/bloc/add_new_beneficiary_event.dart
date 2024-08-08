abstract class AddNewBeneficiaryEvent {}

class AddBeneficiary extends AddNewBeneficiaryEvent {}

class PhoneNumberChanged extends AddNewBeneficiaryEvent {
  final String val;

  PhoneNumberChanged(this.val);
}

class NicknameChanged extends AddNewBeneficiaryEvent {
  final String val;

  NicknameChanged(this.val);
}
