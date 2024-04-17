import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodel/expensemodel.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodelupdate.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:ghhg/features/expenses.dart/data/repos/expenserepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class expenserepoimplementation extends expenserepo {
  @override
  Future<Either<failure, String>> addexpense(
      {required String token, required expensesmodelrequest expense}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.add_expense, token: token, data: expense.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }
      if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Expensemodel>> getexpenses(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Expensemodel expensemodel;
    try {
      Response response = await Getdata.getdata(
          path: "/expenses/all-expenses?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        expensemodel = Expensemodel.fromJson(response.data);
        return right(expensemodel);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deleteexpense(
      {required String token, required int expenseid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/expenses/delete/${expenseid}", token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(
            requestfailure(error_message: response.data["data"]["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, String>> editexpense(
      {required String token,
      required int id,
      required expensesmodelupdaterequest expensemodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/expenses/update/${id}",
          data: expensemodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
