import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/repos/editaqar/editaqarrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class editaqarrepoimplementation extends editaqarrepo {
  @override
  Future<Either<failure, String>> editaqar(
      {required String token,
      required int id,
      required addaqarrequest add_aqar}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/state/update/${id}", data: add_aqar.tojson(), token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم تعديل بيانات العقار  بنجاح") {
        return right("تم تعديل بيانات العقار بنجاح");
      }  else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
      else {
                return left(requestfailure(error_message: response.data["message"]));

      }
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
