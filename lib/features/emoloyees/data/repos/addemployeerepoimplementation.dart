import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/core/errors/handlingerror.dart';
import 'package:ghhg/core/services/apiservice.dart';
import 'package:ghhg/core/urls/urls.dart';
import 'package:ghhg/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:ghhg/features/emoloyees/data/models/employeemodel/employeemodel.dart';
import 'package:ghhg/features/emoloyees/data/repos/addemployeerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class emplyeerepoimplementaion extends employeerepo {
  @override
  Future<Either<failure, String>> addemployee(
      {required String token, required addemployeemodel employee}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.add_employee, token: token, data: employee.tojson());

      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
      
      
       else if (response.data["code"] == 411) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Employeemodel>> getemployees(
      {required String token, required int page}) async {
    Employeemodel employeesmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/employee/get-all-employees?page=${page}", token: token);
      print(response.data);
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم جلب جميع الموظفين التابعه للشركه العقاريه بنجاح") {
        employeesmodel = Employeemodel.fromJson(response.data);
        return right(employeesmodel);
      } else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
      else {
                return left(requestfailure(error_message: response.data["message"]));

      }
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deleteemployee(
      {required String token, required int employeenumber}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/employee/delete/${employeenumber}", token: token);
      if (response.statusCode == 200 && response.data["status"] == true)
        return right("تم حذف البيانات بنجاح");
     else if(response.statusCode == 200 &&
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

  @override
  Future<Either<failure, String>> editemployee(
      {required String token,
      required int id,
      required addemployeemodel employee}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/employee/update/${id}",
          token: token,
          data: employee.tojson());
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      } else if(response.statusCode == 200 &&
          response.data["code"] == 422){
        return left(requestfailure(error_message: response.data["data"][0]));
      }
     
      else if (response.data["code"] == 411) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
