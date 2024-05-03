import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodel/employeecommodel.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodelrequest.dart';
import 'package:ghhg/features/employeecomission/data/repos/employeecomrepo.dart';

class employeecomrepoimplementation extends employeecomrepo {
  @override
  Future<Either<failure, String>> addemployeecom(
      {required String token,
      required employeecommodelrequest employeecom}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.addemployeecom, token: token, data: employeecom.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Employeecommodel>> getemployeecoms(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Employeecommodel employeecommodel;
    try {
      Response response = await Getdata.getdata(
          path: "/employee-commissions/get-all?page=${page}",
          token: token,
          queryParameters: queryParameters);

      if (response.statusCode == 200 && response.data["code"] == 200) {
        employeecommodel = Employeecommodel.fromJson(response.data);
        return right(employeecommodel);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
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
  Future<Either<failure, String>> deleteemployeecom(
      {required String token, required int employeecomid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/employee-commissions/delete/${employeecomid}", token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
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
  Future<Either<failure, String>> editemployeecom(
      {required String token,
      required int id,
      required employeecommodelrequest employeecommodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/employee-commissions/update/${id}",
          data: employeecommodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
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
