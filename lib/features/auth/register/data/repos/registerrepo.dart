import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/auth/register/data/models/registermodel/registermodel.dart';
import 'package:ghhg/features/auth/register/data/models/registermodelrequest.dart';
import 'package:dartz/dartz.dart';

// ignore: camel_case_types
abstract class registerrepo {
  Future<Either<failure, Registermodel>> register(
      {required registerrequest registerrequest});
}
