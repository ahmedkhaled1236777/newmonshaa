import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/lands/data/models/showlands/showlands.dart';
import 'package:dartz/dartz.dart';

abstract class showlandreporeports {
  Future<Either<failure, Showlands>> showland(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
