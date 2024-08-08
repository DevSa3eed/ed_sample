// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final int userStatus;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (new SplashStateBuilder()..update(updates))._build();

  _$SplashState._({required this.userStatus}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userStatus, r'SplashState', 'userStatus');
  }

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState && userStatus == other.userStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashState')
          ..add('userStatus', userStatus))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  int? _userStatus;
  int? get userStatus => _$this._userStatus;
  set userStatus(int? userStatus) => _$this._userStatus = userStatus;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userStatus = $v.userStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashState build() => _build();

  _$SplashState _build() {
    final _$result = _$v ??
        new _$SplashState._(
            userStatus: BuiltValueNullFieldError.checkNotNull(
                userStatus, r'SplashState', 'userStatus'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
