import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:ghhg/features/contracts/data/models/contractmodelrequest.dart';
import 'package:ghhg/features/contracts/data/repos/contractrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class contractrepoimplementation extends contractrepo {
  addcontract(
      {required String token,
      required contractmodelrequest contract,
      int? id}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          queryParameters: {"tenant_id": id},
          path: urls.add_contract,
          token: token,
          data: contract.tojson());
      print("wwwwwwwwwwwwwwwwwwwwwww");
      print(response.data);

      if (response.statusCode == 200 && response.data["status"] == true) {
        print(response.data);
        return right(response.data["message"]);
      }
      if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Contractmodel>> getcontracts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Contractmodel contractmodel;
    try {
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      Response response = await Getdata.getdata(
          path: "/tenant-contract/all-tenant-contracts?page=${page}",
          token: token,
          queryParameters: queryParameters);
      print(response.data);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        contractmodel = Contractmodel.fromJson(response.data);
        return right(contractmodel);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data[0]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deletecontract(
      {required String token, required int contractid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/tenant-contract/delete/${contractid}", token: token);
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

  @override
  Future<Either<failure, String>> editcontract(
      {required String token,
      required int id,
      required contractmodelrequest contractmodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/tenant-contract/update/${id}",
          data: contractmodel.tojson(),
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
