// ignore: camel_case_types
import 'package:ghhg/features/auth/login/data/models/loginmodel/loginmodel.dart';

abstract class loginstate {}

// ignore: camel_case_types
class logininitial extends loginstate {}

class changercounter extends loginstate {}

class loginloading extends loginstate {}

// ignore: camel_case_types
class loginsucces extends loginstate {
  final Loginmodel loginmodel;

  loginsucces({required this.loginmodel});
}

// ignore: camel_case_types
class loginfailure extends loginstate {
  final String error_message;

  // ignore: non_constant_identifier_names
  loginfailure({required this.error_message});
}
