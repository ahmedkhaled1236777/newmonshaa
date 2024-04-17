import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodel/expensemodel.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/data/repos/moneyreportsrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showmoneyrepoimplementationreports extends showmoneyreporeports {
  @override
  Future<Either<failure, Expensemodel>> showmoney(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Expensemodel expensemodel;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/expenses?page=${page}",
          token: token,
          queryParameters: queryParameters);
      print(response.data);
      print(queryParameters);
      if (response.statusCode == 200 && response.data["status"] == true) {
        expensemodel = Expensemodel.fromJson(response.data);
        return right(expensemodel);
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
