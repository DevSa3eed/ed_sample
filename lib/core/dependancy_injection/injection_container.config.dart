// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/add_new_beneficiary/data/datasource/add_new_beneficiary_remote_datasource.dart'
    as _i249;
import '../../features/add_new_beneficiary/data/repository/add_new_beneficiary_repository_impl.dart'
    as _i818;
import '../../features/add_new_beneficiary/domain/repository/add_new_beneficiary_repository.dart'
    as _i445;
import '../../features/add_new_beneficiary/domain/usecases/add_new_beneficiary_usecase.dart'
    as _i791;
import '../../features/add_new_beneficiary/presentation/bloc/add_new_beneficiary_bloc.dart'
    as _i159;
import '../../features/beneficiary_top_up/data/datasource/beneficiary_top_up_remote_datasource.dart'
    as _i949;
import '../../features/beneficiary_top_up/data/repository/beneficiary_top_up_repository_impl.dart'
    as _i918;
import '../../features/beneficiary_top_up/domain/repository/beneficiary_top_up_repository.dart'
    as _i552;
import '../../features/beneficiary_top_up/domain/usecases/beneficiary_top_up_usecase.dart'
    as _i532;
import '../../features/beneficiary_top_up/presentation/bloc/beneficiary_top_up_bloc.dart'
    as _i849;
import '../../features/main_page/data/datasource/main_page_local_datasource.dart'
    as _i332;
import '../../features/main_page/data/datasource/main_page_remote_datasource.dart'
    as _i27;
import '../../features/main_page/data/repository/dealer_main_repository_impl.dart'
    as _i987;
import '../../features/main_page/domain/repository/dealer_main_repository.dart'
    as _i10;
import '../../features/main_page/domain/usecases/get_beneficiaries_usecase.dart'
    as _i336;
import '../../features/main_page/presentation/bloc/main_page_bloc.dart'
    as _i950;
import '../../features/sign_in/data/datasource/sign_in_local_datasource.dart'
    as _i419;
import '../../features/sign_in/data/datasource/sign_in_remote_datasource.dart'
    as _i928;
import '../../features/sign_in/data/repository/sign_in_repository_impl.dart'
    as _i897;
import '../../features/sign_in/domain/repository/sign_in_repository.dart'
    as _i841;
import '../../features/sign_in/domain/usecases/sign_in_usecase.dart' as _i518;
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart' as _i640;
import '../../features/sign_up/data/datasource/sign_up_local_datasource.dart'
    as _i874;
import '../../features/sign_up/data/datasource/sign_up_remote_datasource.dart'
    as _i176;
import '../../features/sign_up/data/repository/sign_up_repository_impl.dart'
    as _i564;
import '../../features/sign_up/domain/repository/sign_up_repository.dart'
    as _i578;
import '../../features/sign_up/domain/usecases/continue_as_guest_usecase.dart'
    as _i692;
import '../../features/sign_up/domain/usecases/sign_up_usecase.dart' as _i18;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i148;
import '../../features/splash/data/datasource/splash_local_datasource.dart'
    as _i55;
import '../../features/splash/data/repository/splash_repository_impl.dart'
    as _i1019;
import '../../features/splash/domain/repository/splash_repository.dart'
    as _i682;
import '../../features/splash/domain/usecases/check_user_logged_id.dart'
    as _i848;
import '../../features/splash/presentation/bloc/splash_bloc.dart' as _i442;
import '../data/models/base_local_data_source.dart' as _i660;
import '../data/models/base_remote_datasource.dart' as _i262;
import '../data/repository/base_repository.dart' as _i94;
import '../domain/usecases/get_user_info_usecase.dart' as _i1067;
import '../domain/usecases/logout.dart' as _i715;
import '../domain/usecases/save_user_info_usecase.dart' as _i542;
import '../network/network_info.dart' as _i932;
import '../util/validator/input_validators.dart' as _i941;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.lazySingletonAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i941.InputValidators>(() => registerModule.inputValidators);
  gh.lazySingleton<_i332.MainPageLocalDataSource>(() =>
      _i332.MainPageLocalDataSourceImpl(
          sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i660.BaseLocalDataSource>(() =>
      _i660.BaseLocalDataSourceImpl(
          sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i874.SignUpLocalDataSource>(() =>
      _i874.SignUpLocalDataSourceImpl(
          sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i55.SplashLocalDataSource>(() =>
      _i55.SplashLocalDataSourceImpl(
          sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i176.SignUpRemoteDataSource>(
      () => _i176.SignUpRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i94.BaseRepository>(() => _i94.BaseRepositoryImpl(
        baseLocalDataSource: gh<_i660.BaseLocalDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
        baseRemoteDataSource: gh<_i262.BaseRemoteDataSource>(),
      ));
  gh.lazySingleton<_i419.SignInLocalDataSource>(() =>
      _i419.SignInLocalDataSourceImpl(
          sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i578.SignUpRepository>(() => _i564.SignUpRepositoryImpl(
        signUpRemoteDataSource: gh<_i176.SignUpRemoteDataSource>(),
        signUpLocalDataSource: gh<_i874.SignUpLocalDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ));
  gh.lazySingleton<_i928.SignInRemoteDataSource>(
      () => _i928.SignInRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i27.MainPageRemoteDataSource>(
      () => _i27.MainPageRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i715.LogoutUseCase>(
      () => _i715.LogoutUseCase(gh<_i94.BaseRepository>()));
  gh.lazySingleton<_i542.SaveUserInfoUseCase>(
      () => _i542.SaveUserInfoUseCase(gh<_i94.BaseRepository>()));
  gh.lazySingleton<_i249.AddNewBeneficiaryRemoteDataSource>(
      () => _i249.AddNewBeneficiaryRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i949.BeneficiaryTopUpRemoteDataSource>(
      () => _i949.BeneficiaryTopUpRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i262.BaseRemoteDataSource>(
      () => _i262.BaseRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
  gh.lazySingleton<_i692.ContinueAsGuestUseCase>(
      () => _i692.ContinueAsGuestUseCase(gh<_i578.SignUpRepository>()));
  gh.lazySingleton<_i18.SignUpUseCase>(
      () => _i18.SignUpUseCase(gh<_i578.SignUpRepository>()));
  gh.lazySingleton<_i841.SignInRepository>(
      () => _i897.DealerSignInRepositoryImpl(
            signInRemoteDataSource: gh<_i928.SignInRemoteDataSource>(),
            signInLocalDataSource: gh<_i419.SignInLocalDataSource>(),
            networkInfo: gh<_i932.NetworkInfo>(),
          ));
  gh.lazySingleton<_i10.MainPageRepository>(() => _i987.MainPageRepositoryImpl(
        dealerMainRemoteDataSource: gh<_i27.MainPageRemoteDataSource>(),
        dealerMainLocalDataSource: gh<_i332.MainPageLocalDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ));
  gh.lazySingleton<_i336.GetBeneficiariesUseCase>(
      () => _i336.GetBeneficiariesUseCase(gh<_i10.MainPageRepository>()));
  gh.factory<_i148.SignUpBloc>(() => _i148.SignUpBloc(
        signUpUseCase: gh<_i18.SignUpUseCase>(),
        saveUserInfoUseCase: gh<_i542.SaveUserInfoUseCase>(),
        continueAsGuestUseCase: gh<_i692.ContinueAsGuestUseCase>(),
        inputValidators: gh<_i941.InputValidators>(),
      ));
  gh.lazySingleton<_i445.AddNewBeneficiaryRepository>(
      () => _i818.AddNewBeneficiaryRepositoryImpl(
            addNewBeneficiaryRemoteDataSource:
                gh<_i249.AddNewBeneficiaryRemoteDataSource>(),
            networkInfo: gh<_i932.NetworkInfo>(),
            baseLocalDataSource: gh<_i660.BaseLocalDataSource>(),
          ));
  gh.lazySingleton<_i1067.GetUserInfoUseCase>(
      () => _i1067.GetUserInfoUseCase(gh<_i841.SignInRepository>()));
  gh.lazySingleton<_i518.SignInUseCase>(
      () => _i518.SignInUseCase(gh<_i841.SignInRepository>()));
  gh.factory<_i640.SignInBloc>(() => _i640.SignInBloc(
        gh<_i518.SignInUseCase>(),
        gh<_i542.SaveUserInfoUseCase>(),
        gh<_i941.InputValidators>(),
      ));
  gh.lazySingleton<_i552.BeneficiaryTopUpRepository>(
      () => _i918.BeneficiaryTopUpRepositoryImpl(
            addNewBeneficiaryRemoteDataSource:
                gh<_i949.BeneficiaryTopUpRemoteDataSource>(),
            networkInfo: gh<_i932.NetworkInfo>(),
            baseLocalDataSource: gh<_i660.BaseLocalDataSource>(),
          ));
  gh.factory<_i950.MainPageBloc>(() => _i950.MainPageBloc(
        gh<_i336.GetBeneficiariesUseCase>(),
        gh<_i1067.GetUserInfoUseCase>(),
      ));
  gh.lazySingleton<_i682.SplashRepository>(() => _i1019.SplashRepositoryImpl(
        splashLocalDataSource: gh<_i55.SplashLocalDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
        baseRemoteDataSource: gh<_i262.BaseRemoteDataSource>(),
      ));
  gh.lazySingleton<_i532.BeneficiaryTopUpUseCase>(() =>
      _i532.BeneficiaryTopUpUseCase(gh<_i552.BeneficiaryTopUpRepository>()));
  gh.factory<_i849.BeneficiaryTopUpBloc>(() => _i849.BeneficiaryTopUpBloc(
        beneficiaryTopUpUseCase: gh<_i532.BeneficiaryTopUpUseCase>(),
        inputValidators: gh<_i941.InputValidators>(),
      ));
  gh.lazySingleton<_i791.AddNewBeneficiaryUseCase>(() =>
      _i791.AddNewBeneficiaryUseCase(gh<_i445.AddNewBeneficiaryRepository>()));
  gh.factory<_i159.AddNewBeneficiaryBloc>(() => _i159.AddNewBeneficiaryBloc(
        addNewBeneficiaryUseCase: gh<_i791.AddNewBeneficiaryUseCase>(),
        inputValidators: gh<_i941.InputValidators>(),
      ));
  gh.lazySingleton<_i848.CheckUserIsLoggedIn>(
      () => _i848.CheckUserIsLoggedIn(gh<_i682.SplashRepository>()));
  gh.factory<_i442.SplashBloc>(() =>
      _i442.SplashBloc(checkUserIsLoggedIn: gh<_i848.CheckUserIsLoggedIn>()));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
