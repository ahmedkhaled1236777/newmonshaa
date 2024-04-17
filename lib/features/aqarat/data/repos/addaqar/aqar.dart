import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/models/allemployeemodel/allemployeemodel.dart';
import 'package:dartz/dartz.dart';

abstract class aqarrepo {
  Future<Either<failure, String>> addaqar(
      {required addaqarrequest myaddaqarrequest, required String token});
  Future<Either<failure, Allemployeemodel>> getallemployees(
      {required String token});
}
