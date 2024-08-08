import 'package:built_value/built_value.dart';

import '../../domain/usecases/sign_in_usecase.dart';

part 'sign_in_state.g.dart';

abstract class SignInState implements Built<SignInState, SignInStateBuilder> {
  SignInState._();

  bool get errorUserNameValidation;

  bool get errorPasswordValidation;

  bool get errorSignIn;

  bool get isSecureText;

  bool get isSigningIn;

  bool get userSignedIn;

  SignInParams get signInParams;

  factory SignInState([updates(SignInStateBuilder b)]) = _$SignInState;

  factory SignInState.initial() {
    return SignInState(
      (b) => b
        ..errorUserNameValidation = false
        ..errorPasswordValidation = false
        ..errorSignIn = false
        ..isSecureText = true
        ..isSigningIn = false
        ..userSignedIn = false
        ..signInParams = new SignInParams('', ''),
    );
  }
}
