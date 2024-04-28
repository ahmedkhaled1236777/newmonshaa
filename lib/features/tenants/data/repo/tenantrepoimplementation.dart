import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodelrequest.dart';
import 'package:ghhg/features/tenants/data/repo/tenantrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class tenantrepoimplementation extends tenantrepo {
  @override
  Future<Either<failure, String>> addtenant(
      {required String token, required tenentmodelrequest tenant}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.add_tenant, token: token, data: tenant.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }
      if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Tenantmodel>> gettenants(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Tenantmodel employeesmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/tenant/all-tenants?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        employeesmodel = Tenantmodel.fromJson(response.data);
        return right(employeesmodel);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
        return left(
            requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deletetenant(
      {required String token, required int tenantid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/tenant/delete/${tenantid}", token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
        return left(
            requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, String>> edittenant(
      {required String token,
      required int id,
      required tenentmodelrequest tenantmodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/tenant/update/${id}",
          data: tenantmodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
        return left(
            requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
