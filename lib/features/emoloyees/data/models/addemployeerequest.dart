import 'package:dio/dio.dart';

class addemployeemodel {
  dynamic? employee_image;
  final String password;
  final String name;
  final String phone;
  final String employee_address;
  final String card_number;
  final String jobtittle;
  final List<String> permessions;

  addemployeemodel(
      {required this.password,
      required this.name,
      required this.jobtittle,
      required this.phone,
      required this.employee_address,
      required this.card_number,
      required this.permessions,
      this.employee_image});
  FormData tojson() => FormData.fromMap({
        if (employee_image != null) "employee_image": employee_image,
        "name": name,
        "phone": phone,
        "password": password,
        "employee_address": employee_address,
        "card_number": card_number,
        "employee_permissions[]": permessions,
        "job_title": jobtittle
      });
}
