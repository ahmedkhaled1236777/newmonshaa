import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/showstate.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/data/repos/aqaratrepos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showaqqarrepoimplementationreports extends showaqarreporeports {
  @override
  Future<Either<failure, Showstate>> showaqar(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Showstate showstate;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/states?page=${page}",
          token: token,
          queryParameters: queryParameters);
      print(response.data);
      print(queryParameters);
      if (response.statusCode == 200 && response.data["status"] == true) {
        showstate = Showstate.fromJson(response.data);
        return right(showstate);
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
