import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/revenus/data/model/revenuesmodelupdaterequest.dart';
import 'package:ghhg/features/revenus/data/model/revenumodel/revenumodel.dart';
import 'package:ghhg/features/revenus/data/model/revenumodelrequest.dart';
import 'package:ghhg/features/revenus/data/repos/revenurepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class revenuerepoimplementation extends revenuerepo {
  @override
  Future<Either<failure, String>> addrevenue(
      {required String token, required revenuesmodelrequest revenue}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.add_expense, token: token, data: revenue.tojson());
      print("/////////////////////////////");
      print(response);
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }
      else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
       else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Revenumodel>> getrevenues(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Revenumodel revenuemodel;
    try {
      Response response = await Getdata.getdata(
          path: "/expenses/all-revenues?page=${page}",
          token: token,
          queryParameters: queryParameters);

      if (response.statusCode == 200 && response.data["code"] == 200) {
        revenuemodel = Revenumodel.fromJson(response.data);
        return right(revenuemodel);
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
  Future<Either<failure, String>> deleterevenue(
      {required String token, required int revenueid}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/expenses/delete/${revenueid}", token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        print(response.data["message"]);
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
  Future<Either<failure, String>> editrevenue(
      {required String token,
      required int id,
      required revenuesmodelupdaterequest revenuemodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/expenses/update/${id}",
          data: revenuemodel.tojson(),
          token: token);

      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      }  else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
