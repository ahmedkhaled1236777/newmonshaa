import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodel/updateprofilemodel.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodelrequest.dart';
import 'package:ghhg/features/settings/data/repos/updateprofilerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class updateprofilerepoimp extends updateprofilerepo {
  @override
  Future<Either<failure, Updateprofilemodel>> updateprofilr(
      {required String token,
      required updateprofilemodelrequest updatecompanyprofilemodel}) async {
    try {
      Updateprofilemodel updateprofilemodel;
      Response response = await Postdata.postdata(
          path: urls.updateprofile,
          token: token,
          data: updatecompanyprofilemodel.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        updateprofilemodel = Updateprofilemodel.fromJson(response.data);
        return right(updateprofilemodel);
      }
      if (response.statusCode == 200 && response.data["code"] == 416) {
        return left(requestfailure(error_message: response.data["message"]));
      }
      if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data["data"][0]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
