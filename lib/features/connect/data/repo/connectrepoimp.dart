import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/connect/data/model/connectmodelrequest.dart';
import 'package:ghhg/features/connect/data/repo/connectrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class connectrepoimplementation extends connectrepo {
  @override
  Future<Either<failure, String>> addmessage(
      {required String token, required connectmodelrequest connect}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: urls.addmessage, token: token, data: connect.tojson());
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
}
