// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignUpState extends SignUpState {
  @override
  final bool errorEmailValidation;
  @override
  final bool errorPhoneNumberValidation;
  @override
  final bool errorPasswordValidation;
  @override
  final bool errorConfirmPasswordValidation;
  @override
  final bool isPasswordObscured;
  @override
  final bool isConfirmPasswordObscured;
  @override
  final bool isSigningUp;
  @override
  final bool errorInSigningUp;
  @override
  final bool userSignedUp;
  @override
  final bool errorLatLongValidation;
  @override
  final SignUpParams signUpParams;

  factory _$SignUpState([void Function(SignUpStateBuilder)? updates]) =>
      (new SignUpStateBuilder()..update(updates))._build();

  _$SignUpState._(
      {required this.errorEmailValidation,
      required this.errorPhoneNumberValidation,
      required this.errorPasswordValidation,
      required this.errorConfirmPasswordValidation,
      required this.isPasswordObscured,
      required this.isConfirmPasswordObscured,
      required this.isSigningUp,
      required this.errorInSigningUp,
      required this.userSignedUp,
      required this.errorLatLongValidation,
      required this.signUpParams})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errorEmailValidation, r'SignUpState', 'errorEmailValidation');
    BuiltValueNullFieldError.checkNotNull(errorPhoneNumberValidation,
        r'SignUpState', 'errorPhoneNumberValidation');
    BuiltValueNullFieldError.checkNotNull(
        errorPasswordValidation, r'SignUpState', 'errorPasswordValidation');
    BuiltValueNullFieldError.checkNotNull(errorConfirmPasswordValidation,
        r'SignUpState', 'errorConfirmPasswordValidation');
    BuiltValueNullFieldError.checkNotNull(
        isPasswordObscured, r'SignUpState', 'isPasswordObscured');
    BuiltValueNullFieldError.checkNotNull(
        isConfirmPasswordObscured, r'SignUpState', 'isConfirmPasswordObscured');
    BuiltValueNullFieldError.checkNotNull(
        isSigningUp, r'SignUpState', 'isSigningUp');
    BuiltValueNullFieldError.checkNotNull(
        errorInSigningUp, r'SignUpState', 'errorInSigningUp');
    BuiltValueNullFieldError.checkNotNull(
        userSignedUp, r'SignUpState', 'userSignedUp');
    BuiltValueNullFieldError.checkNotNull(
        errorLatLongValidation, r'SignUpState', 'errorLatLongValidation');
    BuiltValueNullFieldError.checkNotNull(
        signUpParams, r'SignUpState', 'signUpParams');
  }

  @override
  SignUpState rebuild(void Function(SignUpStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpStateBuilder toBuilder() => new SignUpStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpState &&
        errorEmailValidation == other.errorEmailValidation &&
        errorPhoneNumberValidation == other.errorPhoneNumberValidation &&
        errorPasswordValidation == other.errorPasswordValidation &&
        errorConfirmPasswordValidation ==
            other.errorConfirmPasswordValidation &&
        isPasswordObscured == other.isPasswordObscured &&
        isConfirmPasswordObscured == other.isConfirmPasswordObscured &&
        isSigningUp == other.isSigningUp &&
        errorInSigningUp == other.errorInSigningUp &&
        userSignedUp == other.userSignedUp &&
        errorLatLongValidation == other.errorLatLongValidation &&
        signUpParams == other.signUpParams;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorEmailValidation.hashCode);
    _$hash = $jc(_$hash, errorPhoneNumberValidation.hashCode);
    _$hash = $jc(_$hash, errorPasswordValidation.hashCode);
    _$hash = $jc(_$hash, errorConfirmPasswordValidation.hashCode);
    _$hash = $jc(_$hash, isPasswordObscured.hashCode);
    _$hash = $jc(_$hash, isConfirmPasswordObscured.hashCode);
    _$hash = $jc(_$hash, isSigningUp.hashCode);
    _$hash = $jc(_$hash, errorInSigningUp.hashCode);
    _$hash = $jc(_$hash, userSignedUp.hashCode);
    _$hash = $jc(_$hash, errorLatLongValidation.hashCode);
    _$hash = $jc(_$hash, signUpParams.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignUpState')
          ..add('errorEmailValidation', errorEmailValidation)
          ..add('errorPhoneNumberValidation', errorPhoneNumberValidation)
          ..add('errorPasswordValidation', errorPasswordValidation)
          ..add(
              'errorConfirmPasswordValidation', errorConfirmPasswordValidation)
          ..add('isPasswordObscured', isPasswordObscured)
          ..add('isConfirmPasswordObscured', isConfirmPasswordObscured)
          ..add('isSigningUp', isSigningUp)
          ..add('errorInSigningUp', errorInSigningUp)
          ..add('userSignedUp', userSignedUp)
          ..add('errorLatLongValidation', errorLatLongValidation)
          ..add('signUpParams', signUpParams))
        .toString();
  }
}

class SignUpStateBuilder implements Builder<SignUpState, SignUpStateBuilder> {
  _$SignUpState? _$v;

  bool? _errorEmailValidation;
  bool? get errorEmailValidation => _$this._errorEmailValidation;
  set errorEmailValidation(bool? errorEmailValidation) =>
      _$this._errorEmailValidation = errorEmailValidation;

  bool? _errorPhoneNumberValidation;
  bool? get errorPhoneNumberValidation => _$this._errorPhoneNumberValidation;
  set errorPhoneNumberValidation(bool? errorPhoneNumberValidation) =>
      _$this._errorPhoneNumberValidation = errorPhoneNumberValidation;

  bool? _errorPasswordValidation;
  bool? get errorPasswordValidation => _$this._errorPasswordValidation;
  set errorPasswordValidation(bool? errorPasswordValidation) =>
      _$this._errorPasswordValidation = errorPasswordValidation;

  bool? _errorConfirmPasswordValidation;
  bool? get errorConfirmPasswordValidation =>
      _$this._errorConfirmPasswordValidation;
  set errorConfirmPasswordValidation(bool? errorConfirmPasswordValidation) =>
      _$this._errorConfirmPasswordValidation = errorConfirmPasswordValidation;

  bool? _isPasswordObscured;
  bool? get isPasswordObscured => _$this._isPasswordObscured;
  set isPasswordObscured(bool? isPasswordObscured) =>
      _$this._isPasswordObscured = isPasswordObscured;

  bool? _isConfirmPasswordObscured;
  bool? get isConfirmPasswordObscured => _$this._isConfirmPasswordObscured;
  set isConfirmPasswordObscured(bool? isConfirmPasswordObscured) =>
      _$this._isConfirmPasswordObscured = isConfirmPasswordObscured;

  bool? _isSigningUp;
  bool? get isSigningUp => _$this._isSigningUp;
  set isSigningUp(bool? isSigningUp) => _$this._isSigningUp = isSigningUp;

  bool? _errorInSigningUp;
  bool? get errorInSigningUp => _$this._errorInSigningUp;
  set errorInSigningUp(bool? errorInSigningUp) =>
      _$this._errorInSigningUp = errorInSigningUp;

  bool? _userSignedUp;
  bool? get userSignedUp => _$this._userSignedUp;
  set userSignedUp(bool? userSignedUp) => _$this._userSignedUp = userSignedUp;

  bool? _errorLatLongValidation;
  bool? get errorLatLongValidation => _$this._errorLatLongValidation;
  set errorLatLongValidation(bool? errorLatLongValidation) =>
      _$this._errorLatLongValidation = errorLatLongValidation;

  SignUpParams? _signUpParams;
  SignUpParams? get signUpParams => _$this._signUpParams;
  set signUpParams(SignUpParams? signUpParams) =>
      _$this._signUpParams = signUpParams;

  SignUpStateBuilder();

  SignUpStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorEmailValidation = $v.errorEmailValidation;
      _errorPhoneNumberValidation = $v.errorPhoneNumberValidation;
      _errorPasswordValidation = $v.errorPasswordValidation;
      _errorConfirmPasswordValidation = $v.errorConfirmPasswordValidation;
      _isPasswordObscured = $v.isPasswordObscured;
      _isConfirmPasswordObscured = $v.isConfirmPasswordObscured;
      _isSigningUp = $v.isSigningUp;
      _errorInSigningUp = $v.errorInSigningUp;
      _userSignedUp = $v.userSignedUp;
      _errorLatLongValidation = $v.errorLatLongValidation;
      _signUpParams = $v.signUpParams;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpState;
  }

  @override
  void update(void Function(SignUpStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUpState build() => _build();

  _$SignUpState _build() {
    final _$result = _$v ??
        new _$SignUpState._(
            errorEmailValidation: BuiltValueNullFieldError.checkNotNull(
                errorEmailValidation, r'SignUpState', 'errorEmailValidation'),
            errorPhoneNumberValidation: BuiltValueNullFieldError.checkNotNull(
                errorPhoneNumberValidation, r'SignUpState', 'errorPhoneNumberValidation'),
            errorPasswordValidation: BuiltValueNullFieldError.checkNotNull(
                errorPasswordValidation, r'SignUpState', 'errorPasswordValidation'),
            errorConfirmPasswordValidation:
                BuiltValueNullFieldError.checkNotNull(
                    errorConfirmPasswordValidation,
                    r'SignUpState',
                    'errorConfirmPasswordValidation'),
            isPasswordObscured: BuiltValueNullFieldError.checkNotNull(
                isPasswordObscured, r'SignUpState', 'isPasswordObscured'),
            isConfirmPasswordObscured: BuiltValueNullFieldError.checkNotNull(
                isConfirmPasswordObscured, r'SignUpState', 'isConfirmPasswordObscured'),
            isSigningUp: BuiltValueNullFieldError.checkNotNull(isSigningUp, r'SignUpState', 'isSigningUp'),
            errorInSigningUp: BuiltValueNullFieldError.checkNotNull(errorInSigningUp, r'SignUpState', 'errorInSigningUp'),
            userSignedUp: BuiltValueNullFieldError.checkNotNull(userSignedUp, r'SignUpState', 'userSignedUp'),
            errorLatLongValidation: BuiltValueNullFieldError.checkNotNull(errorLatLongValidation, r'SignUpState', 'errorLatLongValidation'),
            signUpParams: BuiltValueNullFieldError.checkNotNull(signUpParams, r'SignUpState', 'signUpParams'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
