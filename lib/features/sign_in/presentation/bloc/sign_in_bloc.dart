import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../../../core/domain/usecases/save_user_info_usecase.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

@Injectable()
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  final InputValidators inputValidators;

  SignInBloc(this.signInUseCase, this.saveUserInfoUseCase, this.inputValidators)
      : super(SignInState.initial()) {}

  onChangedUserName(String val) {
    add(ChangingUserName(val));
  }

  onChangedPassword(String val) {
    add(ChangingPassword(val));
  }

  onObscureChanged() {
    add(ObscureChanged(!state.isSecureText));
  }

  onSignInSubmit() {
    add(SigningIn());
  }

  onClear() {
    add(Clear());
  }

  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is ChangingUserName) {
      yield state.rebuild(
        (b) => b
          ..signInParams!.email = event.val
          ..errorUserNameValidation = false,
      );
    } else if (event is ChangingPassword) {
      yield state.rebuild(
        (b) => b
          ..signInParams!.password = event.val
          ..errorPasswordValidation = false,
      );
    } else if (event is ObscureChanged) {
      yield state.rebuild((b) => b..isSecureText = event.val);
    } else if (event is SigningIn) {
      yield* mapToSignIn(event);
    } else if (event is Clear) {
      yield state.rebuild((b) => b..errorSignIn = false);
    }
  }

  Stream<SignInState> mapToSignIn(SigningIn event) async* {
    /// If we need to make the validation on the parameters.
    ///
    /// We make validation depending on the `inputValidators` object
    /// so we can use it anywhere in the project and make the validation as
    /// generic (once we modified it in one place then it'll be modified in all
    /// places...

    /*if (state.signInParams.email.isEmpty ||
        !inputValidators.validateEmailInput(state.signInParams.email)) {
      yield state.rebuild((b) => b..errorUserNameValidation = true);
    } else if (state.signInParams.password.isEmpty ||
        !inputValidators.validatePasswordInput(state.signInParams.password)) {
      yield state.rebuild((b) => b..errorPasswordValidation = true);
    } else {
      yield* signIn(event);
    }*/

    yield* signIn(event);
  }

  Stream<SignInState> signIn(SigningIn event) async* {
    yield state.rebuild(
      (b) => b
        ..isSigningIn = true
        ..errorSignIn = false
        ..userSignedIn = false,
    );
    final result = await signInUseCase(state.signInParams);
    yield* result.fold(
      (l) async* {
        if (l is ServerFailure) {
          yield state.rebuild(
            (b) => b
              ..isSigningIn = false
              ..errorSignIn = true
              ..userSignedIn = false,
          );
        } else {
          yield state.rebuild(
            (b) => b
              ..isSigningIn = false
              ..errorSignIn = true
              ..userSignedIn = false,
          );
        }
      },
      (r) async* {
        final result = await saveUserInfoUseCase(r);
        yield* result.fold((l) async* {
          yield state.rebuild(
            (b) => b
              ..isSigningIn = false
              ..errorSignIn = true
              ..userSignedIn = false,
          );
        }, (r) async* {
          yield state.rebuild(
            (b) => b
              ..isSigningIn = false
              ..errorSignIn = false
              ..userSignedIn = true,
          );
        });
      },
    );
  }
}
