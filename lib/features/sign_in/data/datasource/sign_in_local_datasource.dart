import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/models/base_local_data_source.dart';

abstract class SignInLocalDataSource extends BaseLocalDataSource {}

@LazySingleton(as: SignInLocalDataSource)
class SignInLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SignInLocalDataSource {
  SignInLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
