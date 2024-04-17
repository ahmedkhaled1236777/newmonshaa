import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/showstate.dart';
import 'package:dartz/dartz.dart';

abstract class showaqarreporeports {
  Future<Either<failure, Showstate>> showaqar(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
