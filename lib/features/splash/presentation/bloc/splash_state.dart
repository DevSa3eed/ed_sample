import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  int get userStatus;

  SplashState._();

  factory SplashState([updates(SplashStateBuilder b)]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b..userStatus = -100);
  }
}
