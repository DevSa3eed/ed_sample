import 'package:built_value/built_value.dart';

import '../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.g.dart';

abstract class SignUpState implements Built<SignUpState, SignUpStateBuilder> {
  SignUpState._();

  factory SignUpState([updates(SignUpStateBuilder b)]) = _$SignUpState;

  factory SignUpState.initial() {
    return SignUpState(
      (b) => b
        ..errorEmailValidation = false
        ..errorPhoneNumberValidation = false
        ..errorPasswordValidation = false
        ..errorConfirmPasswordValidation = false
        ..isPasswordObscured = true
        ..isConfirmPasswordObscured = true
        ..isSigningUp = false
        ..errorInSigningUp = false
        ..userSignedUp = false
        ..errorLatLongValidation = false
        ..signUpParams = SignUpParams(
            email: '',
            password: '',
            confirmPassword: '',
            phoneNumber: '',),
    );
  }


  bool get errorEmailValidation;

  bool get errorPhoneNumberValidation;

  bool get errorPasswordValidation;

  bool get errorConfirmPasswordValidation;

  bool get isPasswordObscured;

  bool get isConfirmPasswordObscured;

  bool get isSigningUp;

  bool get errorInSigningUp;

  bool get userSignedUp;

  bool get errorLatLongValidation;

  SignUpParams get signUpParams;
}
