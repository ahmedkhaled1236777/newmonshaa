import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/showstate.dart';
import 'package:dartz/dartz.dart';

abstract class showaqarrepo {
  Future<Either<failure, Showstate>> showaqar(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteaqar(
      {required String token, required int aqarnumber});
}
