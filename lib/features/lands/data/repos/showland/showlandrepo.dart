import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/showstate.dart';
import 'package:ghhg/features/lands/data/models/showlands/showlands.dart';
import 'package:dartz/dartz.dart';

abstract class showlandsrepo {
  Future<Either<failure, Showlands>> showlands(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteland(
      {required String token, required int landnumber});
}
