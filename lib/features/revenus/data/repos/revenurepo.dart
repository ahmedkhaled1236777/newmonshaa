import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/revenus/data/model/revenuesmodelupdaterequest.dart';
import 'package:ghhg/features/revenus/data/model/revenumodel/revenumodel.dart';
import 'package:ghhg/features/revenus/data/model/revenumodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class revenuerepo {
  Future<Either<failure, String>> addrevenue(
      {required String token, required revenuesmodelrequest revenue});
  Future<Either<failure, Revenumodel>> getrevenues(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleterevenue(
      {required String token, required int revenueid});
  Future<Either<failure, String>> editrevenue(
      {required String token,
      required int id,
      required revenuesmodelupdaterequest revenuemodel});
}
