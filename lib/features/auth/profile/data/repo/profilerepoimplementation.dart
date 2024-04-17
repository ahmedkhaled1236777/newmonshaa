import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/auth/profile/data/model/profilemodel/profilemodel.dart';
import 'package:ghhg/features/auth/profile/data/repo/profilerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class profilerepoimplementation extends profilerepo {
  @override
  Future<Either<failure, Profilemodel>> getprofile(
      {required String token}) async {
    Profilemodel profilemodel;
    try {
      Response response =
          await Getdata.getdata(path: urls.get_profile, token: token);
      if (response.statusCode == 200 && response.data["status"] == true) {
        profilemodel = Profilemodel.fromJson(response.data);
        return right(profilemodel);
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
