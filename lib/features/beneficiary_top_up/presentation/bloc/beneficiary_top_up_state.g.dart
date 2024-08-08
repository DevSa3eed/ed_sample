// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_top_up_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BeneficiaryTopUpState extends BeneficiaryTopUpState {
  @override
  final bool errorAmountValidation;
  @override
  final TopUpEntity? newTopUpEntity;
  @override
  final String amount;
  @override
  final List<int> fixedAmounts;
  @override
  final bool isToppingUp;
  @override
  final bool errorToppingUp;
  @override
  final bool amountTransferred;
  @override
  final Failure? failure;

  factory _$BeneficiaryTopUpState(
          [void Function(BeneficiaryTopUpStateBuilder)? updates]) =>
      (new BeneficiaryTopUpStateBuilder()..update(updates))._build();

  _$BeneficiaryTopUpState._(
      {required this.errorAmountValidation,
      this.newTopUpEntity,
      required this.amount,
      required this.fixedAmounts,
      required this.isToppingUp,
      required this.errorToppingUp,
      required this.amountTransferred,
      this.failure})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(errorAmountValidation,
        r'BeneficiaryTopUpState', 'errorAmountValidation');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'BeneficiaryTopUpState', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        fixedAmounts, r'BeneficiaryTopUpState', 'fixedAmounts');
    BuiltValueNullFieldError.checkNotNull(
        isToppingUp, r'BeneficiaryTopUpState', 'isToppingUp');
    BuiltValueNullFieldError.checkNotNull(
        errorToppingUp, r'BeneficiaryTopUpState', 'errorToppingUp');
    BuiltValueNullFieldError.checkNotNull(
        amountTransferred, r'BeneficiaryTopUpState', 'amountTransferred');
  }

  @override
  BeneficiaryTopUpState rebuild(
          void Function(BeneficiaryTopUpStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeneficiaryTopUpStateBuilder toBuilder() =>
      new BeneficiaryTopUpStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BeneficiaryTopUpState &&
        errorAmountValidation == other.errorAmountValidation &&
        newTopUpEntity == other.newTopUpEntity &&
        amount == other.amount &&
        fixedAmounts == other.fixedAmounts &&
        isToppingUp == other.isToppingUp &&
        errorToppingUp == other.errorToppingUp &&
        amountTransferred == other.amountTransferred &&
        failure == other.failure;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorAmountValidation.hashCode);
    _$hash = $jc(_$hash, newTopUpEntity.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, fixedAmounts.hashCode);
    _$hash = $jc(_$hash, isToppingUp.hashCode);
    _$hash = $jc(_$hash, errorToppingUp.hashCode);
    _$hash = $jc(_$hash, amountTransferred.hashCode);
    _$hash = $jc(_$hash, failure.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BeneficiaryTopUpState')
          ..add('errorAmountValidation', errorAmountValidation)
          ..add('newTopUpEntity', newTopUpEntity)
          ..add('amount', amount)
          ..add('fixedAmounts', fixedAmounts)
          ..add('isToppingUp', isToppingUp)
          ..add('errorToppingUp', errorToppingUp)
          ..add('amountTransferred', amountTransferred)
          ..add('failure', failure))
        .toString();
  }
}

class BeneficiaryTopUpStateBuilder
    implements Builder<BeneficiaryTopUpState, BeneficiaryTopUpStateBuilder> {
  _$BeneficiaryTopUpState? _$v;

  bool? _errorAmountValidation;
  bool? get errorAmountValidation => _$this._errorAmountValidation;
  set errorAmountValidation(bool? errorAmountValidation) =>
      _$this._errorAmountValidation = errorAmountValidation;

  TopUpEntity? _newTopUpEntity;
  TopUpEntity? get newTopUpEntity => _$this._newTopUpEntity;
  set newTopUpEntity(TopUpEntity? newTopUpEntity) =>
      _$this._newTopUpEntity = newTopUpEntity;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  List<int>? _fixedAmounts;
  List<int>? get fixedAmounts => _$this._fixedAmounts;
  set fixedAmounts(List<int>? fixedAmounts) =>
      _$this._fixedAmounts = fixedAmounts;

  bool? _isToppingUp;
  bool? get isToppingUp => _$this._isToppingUp;
  set isToppingUp(bool? isToppingUp) => _$this._isToppingUp = isToppingUp;

  bool? _errorToppingUp;
  bool? get errorToppingUp => _$this._errorToppingUp;
  set errorToppingUp(bool? errorToppingUp) =>
      _$this._errorToppingUp = errorToppingUp;

  bool? _amountTransferred;
  bool? get amountTransferred => _$this._amountTransferred;
  set amountTransferred(bool? amountTransferred) =>
      _$this._amountTransferred = amountTransferred;

  Failure? _failure;
  Failure? get failure => _$this._failure;
  set failure(Failure? failure) => _$this._failure = failure;

  BeneficiaryTopUpStateBuilder();

  BeneficiaryTopUpStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorAmountValidation = $v.errorAmountValidation;
      _newTopUpEntity = $v.newTopUpEntity;
      _amount = $v.amount;
      _fixedAmounts = $v.fixedAmounts;
      _isToppingUp = $v.isToppingUp;
      _errorToppingUp = $v.errorToppingUp;
      _amountTransferred = $v.amountTransferred;
      _failure = $v.failure;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BeneficiaryTopUpState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BeneficiaryTopUpState;
  }

  @override
  void update(void Function(BeneficiaryTopUpStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BeneficiaryTopUpState build() => _build();

  _$BeneficiaryTopUpState _build() {
    final _$result = _$v ??
        new _$BeneficiaryTopUpState._(
            errorAmountValidation: BuiltValueNullFieldError.checkNotNull(
                errorAmountValidation,
                r'BeneficiaryTopUpState',
                'errorAmountValidation'),
            newTopUpEntity: newTopUpEntity,
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'BeneficiaryTopUpState', 'amount'),
            fixedAmounts: BuiltValueNullFieldError.checkNotNull(
                fixedAmounts, r'BeneficiaryTopUpState', 'fixedAmounts'),
            isToppingUp: BuiltValueNullFieldError.checkNotNull(
                isToppingUp, r'BeneficiaryTopUpState', 'isToppingUp'),
            errorToppingUp: BuiltValueNullFieldError.checkNotNull(
                errorToppingUp, r'BeneficiaryTopUpState', 'errorToppingUp'),
            amountTransferred: BuiltValueNullFieldError.checkNotNull(
                amountTransferred,
                r'BeneficiaryTopUpState',
                'amountTransferred'),
            failure: failure);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
