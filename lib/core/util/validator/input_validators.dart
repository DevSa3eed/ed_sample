import 'package:dartz/dartz.dart';
import '../../error/failures.dart';

class InputValidators {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passwordRegExp =
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

  Either<Failure, String> validateEmailInput(String email) {
    if (email.contains('.') && email.contains('@')) {
      return Right(email);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validatePasswordInput(String password) {
    if (passwordRegExp.hasMatch(password)) {
      return Right(password);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validateUserNameInput(String username) {
    if (username.length > 5)
      return Right(username);
    else
      return Left(InvalidInputFailure());
  }

  bool validateUAEPhoneInput(String phone) {
    /// Here we can list the all cases of UAE phone number...
    print("phone.length = ${phone.length}");
    if (phone.startsWith('0') ||
        phone.length < 9 ||
        phone.length > 9 ||
        !isNumeric(phone)) {
      return false;
    } else {
      return true;
    }
  }

  bool validateTopUpAmount(String val) {
    return true;
  }

  bool isNumeric(String s) {
    return num.tryParse(s) != null;
  }
}

class InvalidInputFailure extends Failure {}
