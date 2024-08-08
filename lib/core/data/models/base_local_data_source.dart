import 'dart:convert';

import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../data/shared_preferences_keys.dart';
import '../../domain/usecases/logout.dart';
import '../../util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSource {
  Future<String?> get token;

  Future<String> get url;

  int? get getUserId;

  String? get user;

  Future<bool> logOutUser(LogOutParams params);

  Future<UserEntity> saveUserInfo(UserEntity userEntity);
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<String?> get token =>
      Future.value(sharedPreferences.getString(SharedPreferencesKeys.TOKEN));

  @override
  Future<bool> logOutUser(LogOutParams params) async {
    await sharedPreferences.clear();
    sharedPreferences.setString(SharedPreferencesKeys.APP_LANGUAGE, 'en');

    return true;
  }

  @override
  Future<String> get url async {
    final res = sharedPreferences.getString(SharedPreferencesKeys.BASE_URL);
    print('res is $res');
    if (res != null) {
      return res;
    } else {
      return Future.value(Endpoints.BASE_URL);
    }
  }

  @override
  String? get user => sharedPreferences.getString(SharedPreferencesKeys.USER);

  @override
  int? get getUserId => sharedPreferences.getInt(SharedPreferencesKeys.ID);

  @override
  Future<UserEntity> saveUserInfo(UserEntity userEntity) async {
    await sharedPreferences.setInt(SharedPreferencesKeys.ID, userEntity.id);
    String user = jsonEncode(userEntity.toJson(userEntity));
    await sharedPreferences.setString(SharedPreferencesKeys.USER, user);
    return userEntity;
  }
}
