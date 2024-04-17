import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/notifications/data/models/notificationsmodel/notificationsmodel.dart';
import 'package:ghhg/features/notifications/data/repos/notificationrepo.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class notificationrepoimplementation extends notificationsrepo {
  @override
  Future<Either<failure, Notificationsmodel>> getnotifications({
    required String token,
    required int page,
  }) async {
    Notificationsmodel notificationModel;
    try {
      Response response = await Getdata.getdata(
        path: "/notifications/all?page=${page}",
        token: token,
      );
      if (response.statusCode == 200 && response.data["code"] == 200) {
        notificationModel = Notificationsmodel.fromJson(response.data);
        return right(notificationModel);
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
}

/* @override
  Future<Either<failure, String>> editreciept(
      {required String token,
      required int id,
      required recieptsmodelrequest recieptmodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/reciepts/update/${id}",
          data: recieptmodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }*/
