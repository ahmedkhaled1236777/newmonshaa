import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:dartz/dartz.dart';

abstract class editlandrepo {
  Future<Either<failure, String>> editland(
      {required String token,
      required int id,
      required addlandrequest add_land});
}
