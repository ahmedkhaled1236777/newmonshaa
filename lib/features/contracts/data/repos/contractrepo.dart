import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:ghhg/features/contracts/data/models/contractmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class contractrepo {
  Future<Either<failure, String>> addcontract(
      {required String token, required contractmodelrequest contract});
  Future<Either<failure, Contractmodel>> getcontracts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deletecontract(
      {required String token, required int contractid});
  Future<Either<failure, String>> editcontract(
      {required String token,
      required int id,
      required contractmodelrequest contractmodel});
}
