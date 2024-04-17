import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/data/model/profitmodel/profitmodel.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/data/repo/profitrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showprofitrepoimplementationreports extends showprofitreporeports {
  @override
  Future<Either<failure, Profitmodel>> showprofit(
      {required String token, Map<String, dynamic>? queryParameters}) async {
    Profitmodel profitmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/profits",
          token: token,
          queryParameters: queryParameters);
      print(response.data);
      print(queryParameters);
      if (response.statusCode == 200 && response.data["status"] == true) {
        profitmodel = Profitmodel.fromJson(response.data);
        return right(profitmodel);
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
