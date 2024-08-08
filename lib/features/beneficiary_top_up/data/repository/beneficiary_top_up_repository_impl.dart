import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ed_sample/core/domain/entity/top_up_entity.dart';
import 'package:ed_sample/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/models/base_local_data_source.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../../../core/domain/entity/user_entity.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/util/constants.dart';
import '../../domain/repository/beneficiary_top_up_repository.dart';
import '../../domain/usecases/beneficiary_top_up_usecase.dart';
import '../datasource/beneficiary_top_up_remote_datasource.dart';

@LazySingleton(as: BeneficiaryTopUpRepository)
class BeneficiaryTopUpRepositoryImpl extends BaseRepositoryImpl
    implements BeneficiaryTopUpRepository {
  final BeneficiaryTopUpRemoteDataSource addNewBeneficiaryRemoteDataSource;

  BeneficiaryTopUpRepositoryImpl(
      {required this.addNewBeneficiaryRemoteDataSource,
      required NetworkInfo networkInfo,
      required BaseLocalDataSource baseLocalDataSource})
      : super(
            baseRemoteDataSource: addNewBeneficiaryRemoteDataSource,
            networkInfo: networkInfo,
            baseLocalDataSource: baseLocalDataSource);

  @override
  Future<Either<Failure, TopUpEntity>> topUp(
      BeneficiaryTopUpParams params) async {
    final user = baseLocalDataSource.user;
    UserEntity userE = UserEntity.fromJson(json.decode(user!));
    if (userE.balance <= (params.amount + 1)) {
      return Left(ServerFailure(ErrorCode.INSUFFICIENT_BALANCE));
    } else {
      /// Here I applied AED 1 for each transaction as Fees for us...
      /// So only as an example so this deduction should be implemented in the
      /// backend...
      ///

      /// Also for the "Acceptance Criteria 5-7" I can put the date of the top-up
      /// transaction inside the `TopUpEntity` and do the logic depending on it...
      /// As an example for the maximum top-up should be AED 3000, So I can pass the history list
      /// from the main page and calculate the total amount of top-ups and do the checking
      /// here (but also this total amount should be implemented in the backend).
      ///
      /// On another acceptance criteria for the "maximum of AED 500 per calendar month per beneficiary."
      /// So also in the frontend code here we can see I put the `BeneficiaryEntity` inside `TopUpEntity`
      /// so I can do the clustering depending on the beneficiary dropped on the amount and then do the condition ...
      /// But these checking cases have to be implemented in the backend also.
      ///
      /// To see how the code in the frontend will be, check and uncomment the code below..
      ///

      /// Here are the all cases from 5-7 and then we can do the checking cases...
      ///
      /// And also we can drop the total amount on the month after adding the date
      /// on the `TopUpEntity`...
      ///
      /// And for the user verification so I'm checking depending on the user property
      /// this field can be true if we go with Sign Up Flow and can be false if we go
      /// with Continue As Guest Flow, after that we can check depending on that field
      /// and if it's true -> per calendar month per beneficiary AED 500
      /// otherwise should be AED 1000. (All of these checking cases also have to be
      /// implemented in the backend).
      ///
      /// I'll not reflect the checking cases into the UI since the idea is clear.
      ///

      final user = baseLocalDataSource.user;
      UserEntity currentUser = UserEntity.fromJson(json.decode(user!));
      Map<int, num> beneficiariesAmounts = {};
      num totalAmount = 0.0;
      List<TopUpEntity> histories = [
        TopUpEntity(
            id: 1,
            beneficiaryEntity: BeneficiaryEntity(
                id: 1, nickName: 'Basel', phoneNumber: '+971552711410'),
            amount: 15.2),
        TopUpEntity(
            id: 2,
            beneficiaryEntity: BeneficiaryEntity(
                id: 2, nickName: 'Islam', phoneNumber: '+971553434342'),
            amount: 30.5),
        TopUpEntity(
            id: 3,
            beneficiaryEntity: BeneficiaryEntity(
                id: 3, nickName: 'Alaa', phoneNumber: '+9715523112121'),
            amount: 25.4),
        TopUpEntity(
            id: 1,
            beneficiaryEntity: BeneficiaryEntity(
                id: 1, nickName: 'Basel', phoneNumber: '+971552711410'),
            amount: 100.85),
      ];
      histories.forEach((element) {
        totalAmount = totalAmount + element.amount;
        if (beneficiariesAmounts.containsKey(element.beneficiaryEntity.id)) {
          beneficiariesAmounts[element.beneficiaryEntity.id] =
              beneficiariesAmounts[element.beneficiaryEntity.id]! +
                  element.amount;
        } else {
          beneficiariesAmounts[element.beneficiaryEntity.id] = element.amount;
        }
      });
      print("Cluster Depending on the beneficiaries' ids = " +
          beneficiariesAmounts.toString());
      print("Total Top UPs = " + totalAmount.toString());
      print("User Verification Status = ${currentUser.isVerified}");

      userE.balance = (userE.balance - params.amount) - 1;
      print("balance after = ${userE.balance}");
      await baseLocalDataSource.saveUserInfo(userE);
      return requestWithToken((token, url) async {
        final result =
            await addNewBeneficiaryRemoteDataSource.topUp(params, token, url);
        if (result.data == null) {
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        } else {
          return Right(result.data!);
        }
      });
    }
  }
}
