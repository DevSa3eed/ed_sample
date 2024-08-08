// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignInState extends SignInState {
  @override
  final bool errorUserNameValidation;
  @override
  final bool errorPasswordValidation;
  @override
  final bool errorSignIn;
  @override
  final bool isSecureText;
  @override
  final bool isSigningIn;
  @override
  final bool userSignedIn;
  @override
  final SignInParams signInParams;

  factory _$SignInState([void Function(SignInStateBuilder)? updates]) =>
      (new SignInStateBuilder()..update(updates))._build();

  _$SignInState._(
      {required this.errorUserNameValidation,
      required this.errorPasswordValidation,
      required this.errorSignIn,
      required this.isSecureText,
      required this.isSigningIn,
      required this.userSignedIn,
      required this.signInParams})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errorUserNameValidation, r'SignInState', 'errorUserNameValidation');
    BuiltValueNullFieldError.checkNotNull(
        errorPasswordValidation, r'SignInState', 'errorPasswordValidation');
    BuiltValueNullFieldError.checkNotNull(
        errorSignIn, r'SignInState', 'errorSignIn');
    BuiltValueNullFieldError.checkNotNull(
        isSecureText, r'SignInState', 'isSecureText');
    BuiltValueNullFieldError.checkNotNull(
        isSigningIn, r'SignInState', 'isSigningIn');
    BuiltValueNullFieldError.checkNotNull(
        userSignedIn, r'SignInState', 'userSignedIn');
    BuiltValueNullFieldError.checkNotNull(
        signInParams, r'SignInState', 'signInParams');
  }

  @override
  SignInState rebuild(void Function(SignInStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInStateBuilder toBuilder() => new SignInStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInState &&
        errorUserNameValidation == other.errorUserNameValidation &&
        errorPasswordValidation == other.errorPasswordValidation &&
        errorSignIn == other.errorSignIn &&
        isSecureText == other.isSecureText &&
        isSigningIn == other.isSigningIn &&
        userSignedIn == other.userSignedIn &&
        signInParams == other.signInParams;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorUserNameValidation.hashCode);
    _$hash = $jc(_$hash, errorPasswordValidation.hashCode);
    _$hash = $jc(_$hash, errorSignIn.hashCode);
    _$hash = $jc(_$hash, isSecureText.hashCode);
    _$hash = $jc(_$hash, isSigningIn.hashCode);
    _$hash = $jc(_$hash, userSignedIn.hashCode);
    _$hash = $jc(_$hash, signInParams.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignInState')
          ..add('errorUserNameValidation', errorUserNameValidation)
          ..add('errorPasswordValidation', errorPasswordValidation)
          ..add('errorSignIn', errorSignIn)
          ..add('isSecureText', isSecureText)
          ..add('isSigningIn', isSigningIn)
          ..add('userSignedIn', userSignedIn)
          ..add('signInParams', signInParams))
        .toString();
  }
}

class SignInStateBuilder implements Builder<SignInState, SignInStateBuilder> {
  _$SignInState? _$v;

  bool? _errorUserNameValidation;
  bool? get errorUserNameValidation => _$this._errorUserNameValidation;
  set errorUserNameValidation(bool? errorUserNameValidation) =>
      _$this._errorUserNameValidation = errorUserNameValidation;

  bool? _errorPasswordValidation;
  bool? get errorPasswordValidation => _$this._errorPasswordValidation;
  set errorPasswordValidation(bool? errorPasswordValidation) =>
      _$this._errorPasswordValidation = errorPasswordValidation;

  bool? _errorSignIn;
  bool? get errorSignIn => _$this._errorSignIn;
  set errorSignIn(bool? errorSignIn) => _$this._errorSignIn = errorSignIn;

  bool? _isSecureText;
  bool? get isSecureText => _$this._isSecureText;
  set isSecureText(bool? isSecureText) => _$this._isSecureText = isSecureText;

  bool? _isSigningIn;
  bool? get isSigningIn => _$this._isSigningIn;
  set isSigningIn(bool? isSigningIn) => _$this._isSigningIn = isSigningIn;

  bool? _userSignedIn;
  bool? get userSignedIn => _$this._userSignedIn;
  set userSignedIn(bool? userSignedIn) => _$this._userSignedIn = userSignedIn;

  SignInParams? _signInParams;
  SignInParams? get signInParams => _$this._signInParams;
  set signInParams(SignInParams? signInParams) =>
      _$this._signInParams = signInParams;

  SignInStateBuilder();

  SignInStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorUserNameValidation = $v.errorUserNameValidation;
      _errorPasswordValidation = $v.errorPasswordValidation;
      _errorSignIn = $v.errorSignIn;
      _isSecureText = $v.isSecureText;
      _isSigningIn = $v.isSigningIn;
      _userSignedIn = $v.userSignedIn;
      _signInParams = $v.signInParams;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignInState;
  }

  @override
  void update(void Function(SignInStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignInState build() => _build();

  _$SignInState _build() {
    final _$result = _$v ??
        new _$SignInState._(
            errorUserNameValidation: BuiltValueNullFieldError.checkNotNull(
                errorUserNameValidation,
                r'SignInState',
                'errorUserNameValidation'),
            errorPasswordValidation: BuiltValueNullFieldError.checkNotNull(
                errorPasswordValidation,
                r'SignInState',
                'errorPasswordValidation'),
            errorSignIn: BuiltValueNullFieldError.checkNotNull(
                errorSignIn, r'SignInState', 'errorSignIn'),
            isSecureText: BuiltValueNullFieldError.checkNotNull(
                isSecureText, r'SignInState', 'isSecureText'),
            isSigningIn: BuiltValueNullFieldError.checkNotNull(
                isSigningIn, r'SignInState', 'isSigningIn'),
            userSignedIn: BuiltValueNullFieldError.checkNotNull(
                userSignedIn, r'SignInState', 'userSignedIn'),
            signInParams: BuiltValueNullFieldError.checkNotNull(
                signInParams, r'SignInState', 'signInParams'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
