import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/clients/data/model/clientmodel/clientmodel.dart';
import 'package:ghhg/features/clients/data/model/clientmodelrequest.dart';
import 'package:ghhg/features/clients/data/repos/clientsrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class clientsrepoimplementation extends clientsrepo {
  @override
  Future<Either<failure, String>> addclients(
      {required String token, required clientmodelrequest clients}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.add_clients, token: token, data: clients.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }
      if (response.statusCode == 200 && response.data["code"] == 409) {
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
  Future<Either<failure, Clientmodel>> getclientss(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Clientmodel clientsmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/clients/get-all-clients?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        clientsmodel = Clientmodel.fromJson(response.data);
        return right(clientsmodel);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      print("//////////////////////////////////////////");
      print(e);
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deleteclients(
      {required String token, required int clientsid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/clients/delete/${clientsid}", token: token);
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
  Future<Either<failure, String>> editclients(
      {required String token,
      required int id,
      required clientmodelrequest clientsmodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/clients/update//${id}",
          data: clientsmodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
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
