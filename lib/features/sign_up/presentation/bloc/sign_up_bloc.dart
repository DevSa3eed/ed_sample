import 'package:bloc/bloc.dart';
import 'package:ed_sample/core/domain/usecases/save_user_info_usecase.dart';
import 'package:ed_sample/features/sign_up/domain/usecases/continue_as_guest_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  final ContinueAsGuestUseCase continueAsGuestUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  final InputValidators inputValidators;

  SignUpBloc(
      {required this.signUpUseCase,
      required this.saveUserInfoUseCase,
      required this.continueAsGuestUseCase,
      required this.inputValidators})
      : super(SignUpState.initial()) {}

  onEmailChanged(String val) {
    add(EmailChanging(val));
  }

  onPasswordChanged(String val) {
    add(PasswordChanging(val));
  }

  onConfirmPasswordChanged(String val) {
    add(ConfirmPasswordChanging(val));
  }

  onPhoneNumberChanged(String val) {
    add(PhoneNumberChanging(val));
  }

  onPasswordObscureChanged() {
    add(PasswordObscureChanging(!state.isPasswordObscured));
  }

  onConfirmPasswordObscureChanged() {
    add(ConfirmPasswordObscureChanging(!state.isConfirmPasswordObscured));
  }

  onSignUpSubmit() {
    add(SigningUp());
  }

  onContinueAsGuest() {
    add(ContinueAsGuest());
  }

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is EmailChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.email = event.val
          ..errorEmailValidation = false,
      );
    } else if (event is PasswordChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.password = event.val
          ..errorPasswordValidation = false,
      );
    } else if (event is ConfirmPasswordChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.confirmPassword = event.val
          ..errorConfirmPasswordValidation = false,
      );
    } else if (event is PhoneNumberChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.phoneNumber = event.val
          ..errorPhoneNumberValidation = false,
      );
    } else if (event is SigningUp) {
      yield* mapToSigningUpUser(event);
    } else if (event is PasswordObscureChanging) {
      yield state.rebuild((b) => b..isPasswordObscured = event.isSecure);
    } else if (event is ConfirmPasswordObscureChanging) {
      yield state.rebuild((b) => b..isConfirmPasswordObscured = event.isSecure);
    } else if (event is ContinueAsGuest) {
      yield* continueAsGuest();
    }
  }

  Stream<SignUpState> continueAsGuest() async* {
    yield state.rebuild(
      (b) => b
        ..isSigningUp = true
        ..errorInSigningUp = false
        ..userSignedUp = false,
    );
    final result = await continueAsGuestUseCase(
        ContinueAsGuestParams("phone number should be replaced here.."));
    yield* result.fold(
      (l) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = true
            ..userSignedUp = false,
        );
      },
      (r) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = false
            ..userSignedUp = true,
        );
      },
    );
  }

  Stream<SignUpState> mapToSigningUpUser(SigningUp event) async* {
    yield* signUp(event);
  }

  Stream<SignUpState> signUp(SigningUp event) async* {
    yield state.rebuild(
      (b) => b
        ..isSigningUp = true
        ..errorInSigningUp = false
        ..userSignedUp = false,
    );
    final result = await signUpUseCase(state.signUpParams);
    yield* result.fold(
      (l) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = true
            ..userSignedUp = false,
        );
      },
      (r) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = false
            ..userSignedUp = true,
        );
      },
    );
  }
}
