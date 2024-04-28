// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/auth/register/data/models/registermodel/registermodel.dart';
import 'package:ghhg/features/auth/register/data/models/registermodelrequest.dart';
import 'package:ghhg/features/auth/register/data/repos/registerrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class registerrepoimplementation extends registerrepo {
  @override
  Future<Either<failure, Registermodel>> register(
      {required registerrequest registerrequest}) async {
    Registermodel registermodel;
    try {
      Response response = await Postdata.postdata(
          path: urls.register, data: registerrequest.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        registermodel = Registermodel.fromJson(response.data);
        return right(registermodel);
      }  else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
      else {
                return left(requestfailure(error_message: response.data["message"]));

      }
      // ignore: curly_braces_in_flow_control_structures
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
