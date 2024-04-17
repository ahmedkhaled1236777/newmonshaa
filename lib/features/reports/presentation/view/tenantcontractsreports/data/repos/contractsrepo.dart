import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:dartz/dartz.dart';

abstract class showcontractsreporeports {
  Future<Either<failure, Contractmodel>> showcontracts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
