import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodel/expensemodel.dart';
import 'package:dartz/dartz.dart';

abstract class showmoneyreporeports {
  Future<Either<failure, Expensemodel>> showmoney(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
