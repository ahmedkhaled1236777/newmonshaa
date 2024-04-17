import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:ghhg/features/emoloyees/data/models/employeemodel/employeemodel.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:dartz/dartz.dart';

abstract class employeerepo {
  Future<Either<failure, String>> addemployee(
      {required String token, required addemployeemodel employee});
  Future<Either<failure, Employeemodel>> getemployees(
      {required String token, required int page});
  Future<Either<failure, String>> deleteemployee(
      {required String token, required int employeenumber});
  Future<Either<failure, String>> editemployee(
      {required String token,
      required int id,
      required addemployeemodel employee});
}
