abstract class SignUpEvent {}

class EmailChanging extends SignUpEvent {
  final String val;

  EmailChanging(this.val);
}

class PasswordChanging extends SignUpEvent {
  final String val;

  PasswordChanging(this.val);
}

class ConfirmPasswordChanging extends SignUpEvent {
  final String val;

  ConfirmPasswordChanging(this.val);
}

class PhoneNumberChanging extends SignUpEvent {
  final String val;

  PhoneNumberChanging(this.val);
}

class PasswordObscureChanging extends SignUpEvent {
  final bool isSecure;

  PasswordObscureChanging(this.isSecure);
}

class ConfirmPasswordObscureChanging extends SignUpEvent {
  final bool isSecure;

  ConfirmPasswordObscureChanging(this.isSecure);
}

class ContinueAsGuest extends SignUpEvent {}

class SigningUp extends SignUpEvent {}

class Clear extends SignUpEvent {}
