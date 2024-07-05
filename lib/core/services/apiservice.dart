import 'package:ghhg/core/urls/urls.dart';
import 'package:dio/dio.dart';

class Apiservice {
  static late Dio dio;
  static initdio() {
    dio = Dio(BaseOptions(baseUrl: urls.baseurl));
   // dio.options.headers['Access-Control-Allow-Origin']='https://mymonshaa.web.app';
  }
}

// ignore: camel_case_types
class Postdata {
  static Future<Response> postdata(
      {required String path,
      String? token,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    var respnse = await Apiservice.dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            headers: {
              
              "Accept": "application/json", "Authorization": token}));
    return respnse;
  }
}

// ignore: camel_case_types
class Getdata {
  static Future<Response> getdata(
      {required String path,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    var respnse = await Apiservice.dio.get(path,
        queryParameters: queryParameters,
        options: Options(
            headers: {"Accept": "application/json", "Authorization": token}));
    return respnse;
  }
}

class Deletedata {
  static Future<Response> deletedata(
      {required String path, String? token}) async {
    Response response = await Apiservice.dio.delete(path,
        options: Options(
            headers: {"Accept": "application/json", "Authorization": token}));
    return response;
  }
}
