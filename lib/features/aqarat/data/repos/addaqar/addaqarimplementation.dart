import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/models/allemployeemodel/allemployeemodel.dart';
import 'package:ghhg/features/aqarat/data/repos/addaqar/aqar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class addaqarimplementation extends aqarrepo {
  @override
  Future<Either<failure, String>> addaqar(
      {required addaqarrequest myaddaqarrequest, required String token}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.add_aqar, data: myaddaqarrequest.tojson(), token: token);
      print(
          "**********************************************************************");
      print(response);
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right("تمت اضافة البيانات بنجاح");
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      print(
          "**********************************************************************");
      print(e);
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, Allemployeemodel>> getallemployees(
      {required String token}) async {
    Allemployeemodel allemployeesmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/clients/get-all-employees", token: token);
      if (response.statusCode == 200 && response.data["status"] == true) {
        allemployeesmodel = Allemployeemodel.fromJson(response.data);
        print(allemployeesmodel);
        return right(allemployeesmodel);
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
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
