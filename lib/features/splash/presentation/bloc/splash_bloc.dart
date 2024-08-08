import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../domain/usecases/check_user_logged_id.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckUserIsLoggedIn checkUserIsLoggedIn;

  SplashBloc({required this.checkUserIsLoggedIn})
      : super(SplashState.initial());

  void onInitializeApp() {
    add(InitializeApp());
  }

  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is InitializeApp) {
      yield* mapToCheckUserStatus();
    }
  }

  Stream<SplashState> mapToCheckUserStatus() async* {
    final result = await checkUserIsLoggedIn(NoParams());
    yield* result.fold((l) async* {}, (r) async* {
      yield state.rebuild((b) => b..userStatus = r);
    });
  }
}
