import 'package:dartz/dartz.dart';
import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodel/employeecommodel.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodelrequest.dart';

abstract class employeecomrepo {
  Future<Either<failure, String>> addemployeecom(
      {required String token, required employeecommodelrequest employeecom});
  Future<Either<failure, Employeecommodel>> getemployeecoms(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteemployeecom(
      {required String token, required int employeecomid});
  Future<Either<failure, String>> editemployeecom(
      {required String token,
      required int id,
      required employeecommodelrequest employeecommodel});
}
