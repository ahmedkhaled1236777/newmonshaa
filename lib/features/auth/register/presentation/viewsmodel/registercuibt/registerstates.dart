import 'package:ghhg/features/auth/register/data/models/registermodel/registermodel.dart';

abstract class registerstate {}

class registerinitaial extends registerstate {}

class registerloading extends registerstate {}

class registersuccess extends registerstate {
  final Registermodel registermodel;

  registersuccess({required this.registermodel});
}

class registerfailure extends registerstate {
  final String error_message;

  registerfailure({required this.error_message});
}
