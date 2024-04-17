import 'dart:io';

import 'package:dio/dio.dart';

class updateprofilemodelrequest {
  final String name;
  final String phone;
  final String companyPhone;
  final String company_adress;
  final String company_name;
  final String currency;
  String? oldpass;
  String? newpass;
  dynamic? logo;

  updateprofilemodelrequest(
      {this.logo,
      this.oldpass,
      this.newpass,
      required this.name,
      required this.phone,
      required this.companyPhone,
      required this.company_adress,
      required this.company_name,
      required this.currency});
  tojson() => FormData.fromMap({
        "name": name,
        "phone": phone,
        "company_name": company_name,
        "company_address": company_adress,
        "company_phone": companyPhone,
        "password": newpass,
        "old_password": oldpass,
        if (logo != null) "logo": logo,
        "currency": currency
      });
}
