// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_beneficiary_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddNewBeneficiaryState extends AddNewBeneficiaryState {
  @override
  final bool errorPhoneNumberValidation;
  @override
  final bool errorNicknameValidation;
  @override
  final SubmitNewBeneficiaryParams submitNewBeneficiaryParams;
  @override
  final bool isAddingBeneficiary;
  @override
  final bool errorAddingBeneficiary;
  @override
  final bool beneficiaryAdded;
  @override
  final BeneficiaryEntity? newBeneficiary;

  factory _$AddNewBeneficiaryState(
          [void Function(AddNewBeneficiaryStateBuilder)? updates]) =>
      (new AddNewBeneficiaryStateBuilder()..update(updates))._build();

  _$AddNewBeneficiaryState._(
      {required this.errorPhoneNumberValidation,
      required this.errorNicknameValidation,
      required this.submitNewBeneficiaryParams,
      required this.isAddingBeneficiary,
      required this.errorAddingBeneficiary,
      required this.beneficiaryAdded,
      this.newBeneficiary})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(errorPhoneNumberValidation,
        r'AddNewBeneficiaryState', 'errorPhoneNumberValidation');
    BuiltValueNullFieldError.checkNotNull(errorNicknameValidation,
        r'AddNewBeneficiaryState', 'errorNicknameValidation');
    BuiltValueNullFieldError.checkNotNull(submitNewBeneficiaryParams,
        r'AddNewBeneficiaryState', 'submitNewBeneficiaryParams');
    BuiltValueNullFieldError.checkNotNull(
        isAddingBeneficiary, r'AddNewBeneficiaryState', 'isAddingBeneficiary');
    BuiltValueNullFieldError.checkNotNull(errorAddingBeneficiary,
        r'AddNewBeneficiaryState', 'errorAddingBeneficiary');
    BuiltValueNullFieldError.checkNotNull(
        beneficiaryAdded, r'AddNewBeneficiaryState', 'beneficiaryAdded');
  }

  @override
  AddNewBeneficiaryState rebuild(
          void Function(AddNewBeneficiaryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNewBeneficiaryStateBuilder toBuilder() =>
      new AddNewBeneficiaryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNewBeneficiaryState &&
        errorPhoneNumberValidation == other.errorPhoneNumberValidation &&
        errorNicknameValidation == other.errorNicknameValidation &&
        submitNewBeneficiaryParams == other.submitNewBeneficiaryParams &&
        isAddingBeneficiary == other.isAddingBeneficiary &&
        errorAddingBeneficiary == other.errorAddingBeneficiary &&
        beneficiaryAdded == other.beneficiaryAdded &&
        newBeneficiary == other.newBeneficiary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorPhoneNumberValidation.hashCode);
    _$hash = $jc(_$hash, errorNicknameValidation.hashCode);
    _$hash = $jc(_$hash, submitNewBeneficiaryParams.hashCode);
    _$hash = $jc(_$hash, isAddingBeneficiary.hashCode);
    _$hash = $jc(_$hash, errorAddingBeneficiary.hashCode);
    _$hash = $jc(_$hash, beneficiaryAdded.hashCode);
    _$hash = $jc(_$hash, newBeneficiary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddNewBeneficiaryState')
          ..add('errorPhoneNumberValidation', errorPhoneNumberValidation)
          ..add('errorNicknameValidation', errorNicknameValidation)
          ..add('submitNewBeneficiaryParams', submitNewBeneficiaryParams)
          ..add('isAddingBeneficiary', isAddingBeneficiary)
          ..add('errorAddingBeneficiary', errorAddingBeneficiary)
          ..add('beneficiaryAdded', beneficiaryAdded)
          ..add('newBeneficiary', newBeneficiary))
        .toString();
  }
}

class AddNewBeneficiaryStateBuilder
    implements Builder<AddNewBeneficiaryState, AddNewBeneficiaryStateBuilder> {
  _$AddNewBeneficiaryState? _$v;

  bool? _errorPhoneNumberValidation;
  bool? get errorPhoneNumberValidation => _$this._errorPhoneNumberValidation;
  set errorPhoneNumberValidation(bool? errorPhoneNumberValidation) =>
      _$this._errorPhoneNumberValidation = errorPhoneNumberValidation;

  bool? _errorNicknameValidation;
  bool? get errorNicknameValidation => _$this._errorNicknameValidation;
  set errorNicknameValidation(bool? errorNicknameValidation) =>
      _$this._errorNicknameValidation = errorNicknameValidation;

  SubmitNewBeneficiaryParams? _submitNewBeneficiaryParams;
  SubmitNewBeneficiaryParams? get submitNewBeneficiaryParams =>
      _$this._submitNewBeneficiaryParams;
  set submitNewBeneficiaryParams(
          SubmitNewBeneficiaryParams? submitNewBeneficiaryParams) =>
      _$this._submitNewBeneficiaryParams = submitNewBeneficiaryParams;

  bool? _isAddingBeneficiary;
  bool? get isAddingBeneficiary => _$this._isAddingBeneficiary;
  set isAddingBeneficiary(bool? isAddingBeneficiary) =>
      _$this._isAddingBeneficiary = isAddingBeneficiary;

  bool? _errorAddingBeneficiary;
  bool? get errorAddingBeneficiary => _$this._errorAddingBeneficiary;
  set errorAddingBeneficiary(bool? errorAddingBeneficiary) =>
      _$this._errorAddingBeneficiary = errorAddingBeneficiary;

  bool? _beneficiaryAdded;
  bool? get beneficiaryAdded => _$this._beneficiaryAdded;
  set beneficiaryAdded(bool? beneficiaryAdded) =>
      _$this._beneficiaryAdded = beneficiaryAdded;

  BeneficiaryEntity? _newBeneficiary;
  BeneficiaryEntity? get newBeneficiary => _$this._newBeneficiary;
  set newBeneficiary(BeneficiaryEntity? newBeneficiary) =>
      _$this._newBeneficiary = newBeneficiary;

  AddNewBeneficiaryStateBuilder();

  AddNewBeneficiaryStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorPhoneNumberValidation = $v.errorPhoneNumberValidation;
      _errorNicknameValidation = $v.errorNicknameValidation;
      _submitNewBeneficiaryParams = $v.submitNewBeneficiaryParams;
      _isAddingBeneficiary = $v.isAddingBeneficiary;
      _errorAddingBeneficiary = $v.errorAddingBeneficiary;
      _beneficiaryAdded = $v.beneficiaryAdded;
      _newBeneficiary = $v.newBeneficiary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNewBeneficiaryState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddNewBeneficiaryState;
  }

  @override
  void update(void Function(AddNewBeneficiaryStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNewBeneficiaryState build() => _build();

  _$AddNewBeneficiaryState _build() {
    final _$result = _$v ??
        new _$AddNewBeneficiaryState._(
            errorPhoneNumberValidation: BuiltValueNullFieldError.checkNotNull(
                errorPhoneNumberValidation,
                r'AddNewBeneficiaryState',
                'errorPhoneNumberValidation'),
            errorNicknameValidation: BuiltValueNullFieldError.checkNotNull(
                errorNicknameValidation, r'AddNewBeneficiaryState', 'errorNicknameValidation'),
            submitNewBeneficiaryParams: BuiltValueNullFieldError.checkNotNull(
                submitNewBeneficiaryParams,
                r'AddNewBeneficiaryState',
                'submitNewBeneficiaryParams'),
            isAddingBeneficiary: BuiltValueNullFieldError.checkNotNull(
                isAddingBeneficiary, r'AddNewBeneficiaryState', 'isAddingBeneficiary'),
            errorAddingBeneficiary: BuiltValueNullFieldError.checkNotNull(
                errorAddingBeneficiary, r'AddNewBeneficiaryState', 'errorAddingBeneficiary'),
            beneficiaryAdded: BuiltValueNullFieldError.checkNotNull(
                beneficiaryAdded, r'AddNewBeneficiaryState', 'beneficiaryAdded'),
            newBeneficiary: newBeneficiary);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
