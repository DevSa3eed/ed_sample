import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ed_sample/core/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/models/base_remote_datasource.dart';
import '../../../../../core/network/models/base_response_model.dart';

abstract class SignInRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<UserEntity>> login(String email, String password);
}

@LazySingleton(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignInRemoteDataSource {
  SignInRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  /// Logs in a user with the given email and password.
  ///
  /// Parameters:
  ///   - email: The email of the user.
  ///   - password: The password of the user.
  ///
  /// Returns:
  ///   - A [Future] that resolves to a [BaseResponseModel] containing the logged-in user's information.
  ///     If the login is successful, the [data] field of the [BaseResponseModel] will contain a [UserEntity]
  ///     object with the user's ID, verification status, and balance. If the login fails, the [data] field
  ///     will be null and the [message] field will contain an error message.
  ///
  /// Throws:
  ///   - A [DioException] if there is an error with the HTTP request.
  @override
  Future<BaseResponseModel<UserEntity>> login(
      String email, String password) async {
    try {
      return BaseResponseModel(
          data: UserEntity(id: 1, isVerified: true, balance: 5000));
    } catch (e) {
      if (e is DioException) {
        return BaseResponseModel(
            data: null, message: json.decode(e.response?.data)['result']);
      } else {
        return BaseResponseModel(data: null, message: "");
      }
    }
  }
}
