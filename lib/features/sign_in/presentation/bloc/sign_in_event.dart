abstract class SignInEvent {}

class ChangingUserName extends SignInEvent {
  final String val;

  ChangingUserName(this.val);
}

class ChangingPassword extends SignInEvent {
  final String val;

  ChangingPassword(this.val);
}

class ObscureChanged extends SignInEvent {
  final bool val;

  ObscureChanged(this.val);
}

class SigningIn extends SignInEvent {}

class Clear extends SignInEvent {}
