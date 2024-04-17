import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class tenantrepo {
  Future<Either<failure, String>> addtenant(
      {required String token, required tenentmodelrequest tenant});
  Future<Either<failure, Tenantmodel>> gettenants(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deletetenant(
      {required String token, required int tenantid});
  Future<Either<failure, String>> edittenant(
      {required String token,
      required int id,
      required tenentmodelrequest tenantmodel});
}
