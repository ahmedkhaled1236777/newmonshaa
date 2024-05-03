import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/showstate.dart';
import 'package:ghhg/features/aqarat/data/repos/showaqar/showaqarrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showaqqarrepoimplementation extends showaqarrepo {
  @override
  Future<Either<failure, Showstate>> showaqar(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Showstate showstate;
    try {
      Response response = await Getdata.getdata(
          path: "/state/all-states?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم الحصول على بيانات جميع العقارات بنجاح") {
        showstate = Showstate.fromJson(response.data);
        return right(showstate);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, String>> deleteaqar(
      {required String token, required int aqarnumber}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/state/delete/${aqarnumber}", token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم حذف بيانات العقار  بنجاح")
        return right("تم حذف البيانات بنجاح");
      else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
