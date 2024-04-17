import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/financial/data/model/financialmodel/financialmodel.dart';
import 'package:ghhg/features/financial/data/model/financialmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class financialrepo {
  Future<Either<failure, String>> addfinancial(
      {required String token,
      required financialmodelrequest financial,
      required int id});
  Future<Either<failure, Financialmodel>> getfinancials(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deletefinancial(
      {required String token, required int financialid});
}
