import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/data/model/profitmodel/profitmodel.dart';
import 'package:dartz/dartz.dart';

abstract class showprofitreporeports {
  Future<Either<failure, Profitmodel>> showprofit(
      {required String token, Map<String, dynamic>? queryParameters});
}
