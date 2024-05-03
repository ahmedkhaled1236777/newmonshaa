import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/repos/editaqar/editaqarrepo.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/data/repos/editland/editlandrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class editlandrepoimplementation extends editlandrepo {
  @override
  Future<Either<failure, String>> editland(
      {required String token,
      required int id,
      required addlandrequest add_land}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/land/update/${id}", data: add_land.tojson(), token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم تعديل بيانات الارض  بنجاح") {
        return right("تم تعديل بيانات الارض  بنجاح");
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
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
