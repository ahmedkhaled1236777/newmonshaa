import 'package:ghhg/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class logoutrepo {
  Future<Either<failure, String>> logout(
      {required String token, required String devicetoken});
}
