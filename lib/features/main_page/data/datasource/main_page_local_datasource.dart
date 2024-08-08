import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/models/base_local_data_source.dart';

abstract class MainPageLocalDataSource extends BaseLocalDataSource {}

@LazySingleton(as: MainPageLocalDataSource)
class MainPageLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements MainPageLocalDataSource {
  MainPageLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
