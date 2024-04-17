import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/data/repos/contractsrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showcontractsrepoimplementationreports extends showcontractsreporeports {
  @override
  Future<Either<failure, Contractmodel>> showcontracts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Contractmodel contractmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/reports/tenant-contracts?page=${page}",
          token: token,
          queryParameters: queryParameters);

      if (response.statusCode == 200 && response.data["status"] == true) {
        contractmodel = Contractmodel.fromJson(response.data);
        return right(contractmodel);
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
