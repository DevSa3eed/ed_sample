// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainPageState extends MainPageState {
  @override
  final UserEntity? currentUser;
  @override
  final bool isLoadingInfo;
  @override
  final bool isLoadingBeneficiaries;
  @override
  final bool errorLoadingBeneficiaries;
  @override
  final bool beneficiariesLoaded;
  @override
  final List<BeneficiaryEntity> beneficiaries;
  @override
  final bool errorAddNewBeneficiary;
  @override
  final bool newBeneficiaryAdded;
  @override
  final Failure? failure;
  @override
  final List<TopUpEntity> historyTopUPs;

  factory _$MainPageState([void Function(MainPageStateBuilder)? updates]) =>
      (new MainPageStateBuilder()..update(updates))._build();

  _$MainPageState._(
      {this.currentUser,
      required this.isLoadingInfo,
      required this.isLoadingBeneficiaries,
      required this.errorLoadingBeneficiaries,
      required this.beneficiariesLoaded,
      required this.beneficiaries,
      required this.errorAddNewBeneficiary,
      required this.newBeneficiaryAdded,
      this.failure,
      required this.historyTopUPs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoadingInfo, r'MainPageState', 'isLoadingInfo');
    BuiltValueNullFieldError.checkNotNull(
        isLoadingBeneficiaries, r'MainPageState', 'isLoadingBeneficiaries');
    BuiltValueNullFieldError.checkNotNull(errorLoadingBeneficiaries,
        r'MainPageState', 'errorLoadingBeneficiaries');
    BuiltValueNullFieldError.checkNotNull(
        beneficiariesLoaded, r'MainPageState', 'beneficiariesLoaded');
    BuiltValueNullFieldError.checkNotNull(
        beneficiaries, r'MainPageState', 'beneficiaries');
    BuiltValueNullFieldError.checkNotNull(
        errorAddNewBeneficiary, r'MainPageState', 'errorAddNewBeneficiary');
    BuiltValueNullFieldError.checkNotNull(
        newBeneficiaryAdded, r'MainPageState', 'newBeneficiaryAdded');
    BuiltValueNullFieldError.checkNotNull(
        historyTopUPs, r'MainPageState', 'historyTopUPs');
  }

  @override
  MainPageState rebuild(void Function(MainPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainPageStateBuilder toBuilder() => new MainPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainPageState &&
        currentUser == other.currentUser &&
        isLoadingInfo == other.isLoadingInfo &&
        isLoadingBeneficiaries == other.isLoadingBeneficiaries &&
        errorLoadingBeneficiaries == other.errorLoadingBeneficiaries &&
        beneficiariesLoaded == other.beneficiariesLoaded &&
        beneficiaries == other.beneficiaries &&
        errorAddNewBeneficiary == other.errorAddNewBeneficiary &&
        newBeneficiaryAdded == other.newBeneficiaryAdded &&
        failure == other.failure &&
        historyTopUPs == other.historyTopUPs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, isLoadingInfo.hashCode);
    _$hash = $jc(_$hash, isLoadingBeneficiaries.hashCode);
    _$hash = $jc(_$hash, errorLoadingBeneficiaries.hashCode);
    _$hash = $jc(_$hash, beneficiariesLoaded.hashCode);
    _$hash = $jc(_$hash, beneficiaries.hashCode);
    _$hash = $jc(_$hash, errorAddNewBeneficiary.hashCode);
    _$hash = $jc(_$hash, newBeneficiaryAdded.hashCode);
    _$hash = $jc(_$hash, failure.hashCode);
    _$hash = $jc(_$hash, historyTopUPs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainPageState')
          ..add('currentUser', currentUser)
          ..add('isLoadingInfo', isLoadingInfo)
          ..add('isLoadingBeneficiaries', isLoadingBeneficiaries)
          ..add('errorLoadingBeneficiaries', errorLoadingBeneficiaries)
          ..add('beneficiariesLoaded', beneficiariesLoaded)
          ..add('beneficiaries', beneficiaries)
          ..add('errorAddNewBeneficiary', errorAddNewBeneficiary)
          ..add('newBeneficiaryAdded', newBeneficiaryAdded)
          ..add('failure', failure)
          ..add('historyTopUPs', historyTopUPs))
        .toString();
  }
}

class MainPageStateBuilder
    implements Builder<MainPageState, MainPageStateBuilder> {
  _$MainPageState? _$v;

  UserEntity? _currentUser;
  UserEntity? get currentUser => _$this._currentUser;
  set currentUser(UserEntity? currentUser) => _$this._currentUser = currentUser;

  bool? _isLoadingInfo;
  bool? get isLoadingInfo => _$this._isLoadingInfo;
  set isLoadingInfo(bool? isLoadingInfo) =>
      _$this._isLoadingInfo = isLoadingInfo;

  bool? _isLoadingBeneficiaries;
  bool? get isLoadingBeneficiaries => _$this._isLoadingBeneficiaries;
  set isLoadingBeneficiaries(bool? isLoadingBeneficiaries) =>
      _$this._isLoadingBeneficiaries = isLoadingBeneficiaries;

  bool? _errorLoadingBeneficiaries;
  bool? get errorLoadingBeneficiaries => _$this._errorLoadingBeneficiaries;
  set errorLoadingBeneficiaries(bool? errorLoadingBeneficiaries) =>
      _$this._errorLoadingBeneficiaries = errorLoadingBeneficiaries;

  bool? _beneficiariesLoaded;
  bool? get beneficiariesLoaded => _$this._beneficiariesLoaded;
  set beneficiariesLoaded(bool? beneficiariesLoaded) =>
      _$this._beneficiariesLoaded = beneficiariesLoaded;

  List<BeneficiaryEntity>? _beneficiaries;
  List<BeneficiaryEntity>? get beneficiaries => _$this._beneficiaries;
  set beneficiaries(List<BeneficiaryEntity>? beneficiaries) =>
      _$this._beneficiaries = beneficiaries;

  bool? _errorAddNewBeneficiary;
  bool? get errorAddNewBeneficiary => _$this._errorAddNewBeneficiary;
  set errorAddNewBeneficiary(bool? errorAddNewBeneficiary) =>
      _$this._errorAddNewBeneficiary = errorAddNewBeneficiary;

  bool? _newBeneficiaryAdded;
  bool? get newBeneficiaryAdded => _$this._newBeneficiaryAdded;
  set newBeneficiaryAdded(bool? newBeneficiaryAdded) =>
      _$this._newBeneficiaryAdded = newBeneficiaryAdded;

  Failure? _failure;
  Failure? get failure => _$this._failure;
  set failure(Failure? failure) => _$this._failure = failure;

  List<TopUpEntity>? _historyTopUPs;
  List<TopUpEntity>? get historyTopUPs => _$this._historyTopUPs;
  set historyTopUPs(List<TopUpEntity>? historyTopUPs) =>
      _$this._historyTopUPs = historyTopUPs;

  MainPageStateBuilder();

  MainPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentUser = $v.currentUser;
      _isLoadingInfo = $v.isLoadingInfo;
      _isLoadingBeneficiaries = $v.isLoadingBeneficiaries;
      _errorLoadingBeneficiaries = $v.errorLoadingBeneficiaries;
      _beneficiariesLoaded = $v.beneficiariesLoaded;
      _beneficiaries = $v.beneficiaries;
      _errorAddNewBeneficiary = $v.errorAddNewBeneficiary;
      _newBeneficiaryAdded = $v.newBeneficiaryAdded;
      _failure = $v.failure;
      _historyTopUPs = $v.historyTopUPs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainPageState;
  }

  @override
  void update(void Function(MainPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainPageState build() => _build();

  _$MainPageState _build() {
    final _$result = _$v ??
        new _$MainPageState._(
            currentUser: currentUser,
            isLoadingInfo: BuiltValueNullFieldError.checkNotNull(
                isLoadingInfo, r'MainPageState', 'isLoadingInfo'),
            isLoadingBeneficiaries: BuiltValueNullFieldError.checkNotNull(
                isLoadingBeneficiaries, r'MainPageState', 'isLoadingBeneficiaries'),
            errorLoadingBeneficiaries: BuiltValueNullFieldError.checkNotNull(
                errorLoadingBeneficiaries, r'MainPageState', 'errorLoadingBeneficiaries'),
            beneficiariesLoaded: BuiltValueNullFieldError.checkNotNull(
                beneficiariesLoaded, r'MainPageState', 'beneficiariesLoaded'),
            beneficiaries: BuiltValueNullFieldError.checkNotNull(
                beneficiaries, r'MainPageState', 'beneficiaries'),
            errorAddNewBeneficiary: BuiltValueNullFieldError.checkNotNull(
                errorAddNewBeneficiary, r'MainPageState', 'errorAddNewBeneficiary'),
            newBeneficiaryAdded: BuiltValueNullFieldError.checkNotNull(
                newBeneficiaryAdded, r'MainPageState', 'newBeneficiaryAdded'),
            failure: failure,
            historyTopUPs: BuiltValueNullFieldError.checkNotNull(historyTopUPs, r'MainPageState', 'historyTopUPs'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
