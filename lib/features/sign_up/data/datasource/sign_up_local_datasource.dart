import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/data/models/base_local_data_source.dart';

abstract class SignUpLocalDataSource extends BaseLocalDataSource {}

@LazySingleton(as: SignUpLocalDataSource)
class SignUpLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SignUpLocalDataSource {
  SignUpLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
