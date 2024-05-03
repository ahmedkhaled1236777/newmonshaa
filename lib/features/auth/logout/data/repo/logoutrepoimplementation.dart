import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/auth/logout/data/repo/logoutrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class logoutrepoimplementation extends logoutrepo {
  @override
  Future<Either<failure, String>> logout(
      {required String token, required String devicetoken}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.log_out,
          token: token,
          queryParameters: {"token": devicetoken});

      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
