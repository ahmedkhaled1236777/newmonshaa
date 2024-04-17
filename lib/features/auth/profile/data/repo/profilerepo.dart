import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/auth/profile/data/model/profilemodel/profilemodel.dart';
import 'package:dartz/dartz.dart';

abstract class profilerepo {
  Future<Either<failure, Profilemodel>> getprofile({required String token});
}
