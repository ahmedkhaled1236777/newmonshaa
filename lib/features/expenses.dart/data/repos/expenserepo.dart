import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodel/expensemodel.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodelupdate.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class expenserepo {
  Future<Either<failure, String>> addexpense(
      {required String token, required expensesmodelrequest expense});
  Future<Either<failure, Expensemodel>> getexpenses(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteexpense(
      {required String token, required int expenseid});
  Future<Either<failure, String>> editexpense(
      {required String token,
      required int id,
      required expensesmodelupdaterequest expensemodel});
}
