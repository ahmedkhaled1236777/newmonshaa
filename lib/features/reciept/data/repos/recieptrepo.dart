import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/reciept/data/models/allrecieptmodel/allrecieptmodel.dart';
import 'package:ghhg/features/reciept/data/models/recieptmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class recieptrepo {
  Future<Either<failure, String>> addreciept(
      {required String token,
      required recieptsmodelrequest reciept,
      required int id});
  Future<Either<failure, Allrecieptmodel>> getreciepts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deletereciept(
      {required String token, required int recieptid});
  /* Future<Either<failure, String>> editreciept(
      {required String token,
      required int id,
      required recieptsmodelrequest recieptmodel});*/
}
