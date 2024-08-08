import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/domain/entity/top_up_entity.dart';
import 'package:ed_sample/core/domain/usecases/usecase.dart';
import 'package:ed_sample/core/error/failures.dart';
import 'package:ed_sample/core/util/constants.dart';
import 'package:ed_sample/features/main_page/domain/usecases/get_beneficiaries_usecase.dart';
import 'package:ed_sample/features/main_page/presentation/bloc/main_page_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/get_user_info_usecase.dart';
import 'main_page_state.dart';

@Injectable()
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final GetBeneficiariesUseCase getBeneficiariesUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  MainPageBloc(
    this.getBeneficiariesUseCase,
    this.getUserInfoUseCase,
  ) : super(MainPageState.initial());

  void onInitializePage() {
    add(InitializePage());
  }

  void onAddNewBeneficiary(BeneficiaryEntity beneficiaryEntity) {
    add(AddBeneficiary(beneficiaryEntity));
  }

  void onClearErrors() {
    add(ClearErrors());
  }

  void onTopUpAdded(TopUpEntity topUpEntity) {
    add(TopUpAdded(topUpEntity));
  }

  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    if (event is InitializePage) {
      yield* getCurrentUser();
      yield* getUserBeneficiaries();
    } else if (event is AddBeneficiary) {
      yield* addBeneficiary(event);
    } else if (event is ClearErrors) {
      yield state.rebuild((p0) => p0
        ..failure = null
        ..errorAddNewBeneficiary = false
        ..newBeneficiaryAdded = false);
    } else if (event is TopUpAdded) {
      yield state
          .rebuild((p0) => p0..historyTopUPs!.insert(0, event.topUpEntity));
      yield* getCurrentUser();
    }
  }

  Stream<MainPageState> addBeneficiary(AddBeneficiary event) async* {
    /// Adds a new beneficiary to the state.
    ///
    /// This function takes an [AddBeneficiary] event as a parameter and adds the beneficiary to the state if the number of beneficiaries is less than or equal to 4. If the number of beneficiaries is greater than 4, it sets the `errorAddNewBeneficiary` flag to `true` and sets the `failure` to a `ServerFailure` with the error code `ERROR_ADD_BENEFICIARY`.
    ///
    /// Parameters:
    /// - `event` (AddBeneficiary): The event containing the beneficiary to be added.
    ///
    /// Returns:
    /// - `Stream<MainPageState>`: A stream of `MainPageState` objects representing the updated state after adding the beneficiary.
    if (state.beneficiaries.length <= 4) {
      yield state.rebuild((p0) => p0
        ..beneficiaries!.insert(0, event.beneficiaryEntity)
        ..newBeneficiaryAdded = true);
    } else {
      yield state.rebuild((p0) => p0
        ..errorAddNewBeneficiary = true
        ..failure = ServerFailure(ErrorCode.ERROR_ADD_BENEFICIARY));
    }
  }

  Stream<MainPageState> getCurrentUser() async* {
    final result = await getUserInfoUseCase(NoParams());
    yield* result.fold((l) async* {}, (r) async* {
      yield state.rebuild((p0) => p0..currentUser = r);
    });
  }

  Stream<MainPageState> getUserBeneficiaries() async* {
    yield state.rebuild((p0) => p0
      ..isLoadingBeneficiaries = true
      ..errorLoadingBeneficiaries = false
      ..beneficiariesLoaded = false);
    final result = await getBeneficiariesUseCase(NoParams());
    yield* result.fold((l) async* {
      yield state.rebuild((p0) => p0
        ..failure = l
        ..isLoadingBeneficiaries = false
        ..errorLoadingBeneficiaries = false
        ..beneficiariesLoaded = false);
    }, (r) async* {
      yield state.rebuild((p0) => p0
            ..isLoadingBeneficiaries = false
            ..errorLoadingBeneficiaries = false
            ..beneficiariesLoaded = true
          // ..beneficiaries = r
          );
    });
  }
}
