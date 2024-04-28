import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/auth/login/data/models/loginmodel/loginmodel.dart';
import 'package:ghhg/features/auth/login/data/models/loginrequest.dart';
import 'package:ghhg/features/auth/login/data/repos/loginrepo/loginrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// ignore: camel_case_types
class login_repo_implementation extends loginrepo {
  @override
  // ignore: non_constant_identifier_names
  Future<Either<failure, Loginmodel>> login(
      {required loginrequest login}) async {
    Loginmodel loginModel;
    try {
      var response =
          await Postdata.postdata(path: urls.login, data: login.tojson());

      if (response.statusCode == 200 && response.data["status"] == true) {
        loginModel = Loginmodel.fromJson(response.data);
        print("hjbghghbghvghvghvghvghvghgvghvghvgh");
        print(response);
        return right(loginModel);
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
