import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/lands/data/models/showlands/showlands.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/data/repos/landsreports.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showlandrepoimplementationreports extends showlandreporeports {
  @override
  Future<Either<failure, Showlands>> showland(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Showlands showstate;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/lands?page=${page}",
          token: token,
          queryParameters: queryParameters);

      if (response.statusCode == 200 && response.data["status"] == true) {
        showstate = Showlands.fromJson(response.data);
        return right(showstate);
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
