import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:ghhg/features/finishedcontracts/data/repos/finishedcontractsrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class finishedconreactsrepoimplementation extends finishedcontractrepo {
  @override
  Future<Either<failure, Contractmodel>> getcontracts({
    required String token,
    required int page,
  }) async {
    Contractmodel finishedcontractmodel;
    try {
      Response response = await Getdata.getdata(
        path: "/tenant-contracts-expired/all?page=${page}",
        token: token,
      );
      print(response.data);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        finishedcontractmodel = Contractmodel.fromJson(response.data);
        return right(finishedcontractmodel);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["data"][0]));
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
          path: "/tenant-contracts-expired/remove-from-screen//${contractid}",
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
