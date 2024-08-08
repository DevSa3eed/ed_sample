import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/data/models/base_local_data_source.dart';

abstract class SplashLocalDataSource extends BaseLocalDataSource {
  Future<int?> getUserStatus();
}

@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SplashLocalDataSource {
  SplashLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  Future<int?> getUserStatus() {
    /// bool? usesStatus =
    ///    sharedPreferences.getBool(SharedPreferencesKeys.IS_FIRST_TIME_USES);

    /// Here we have to implement the logic for detecting if the user is already
    /// singed up or logged in before, after that we call an API to validate the
    /// stored token (Shared Preferences) in right case we move the user into the main
    /// screen to continue browsing the features; otherwise do logout and clear the
    /// `Shared Preferences` data...

    return Future.value(-2);
  }
}
