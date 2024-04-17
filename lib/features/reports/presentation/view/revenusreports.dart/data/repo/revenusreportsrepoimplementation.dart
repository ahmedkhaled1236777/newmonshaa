import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/data/repo/revenusreportsrepo.dart';
import 'package:ghhg/features/revenus/data/model/revenumodel/revenumodel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showrevenusrepoimplementationreports extends showrevenusreporeports {
  @override
  Future<Either<failure, Revenumodel>> showrevenus(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Revenumodel revenumodel;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/revenues?page=${page}",
          token: token,
          queryParameters: queryParameters);
      print(response.data);
      print(queryParameters);
      if (response.statusCode == 200 && response.data["status"] == true) {
        revenumodel = Revenumodel.fromJson(response.data);
        return right(revenumodel);
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
