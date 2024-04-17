import 'package:flutter/material.dart';

@immutable
abstract class financialState {}

class financialInitial extends financialState {}

class financialchangecontrollers extends financialState {}

class editfinancialloading extends financialState {}

class editfinancialsuccess extends financialState {
  final String success_message;

  editfinancialsuccess({required this.success_message});
}

class editfinancialfailure extends financialState {
  final String error_message;

  editfinancialfailure({required this.error_message});
}

class showfinancialloadin extends financialState {}

class deletefinancialsuccess extends financialState {
  final String succes_message;

  deletefinancialsuccess({required this.succes_message});
}

class deletefinancialfailure extends financialState {
  final String errormessage;

  deletefinancialfailure({required this.errormessage});
}

class showfinancialsuccess extends financialState {}

class showfinancialfailure extends financialState {
  final String errorr_message;

  showfinancialfailure({required this.errorr_message});
}

class Addfinancialloading extends financialState {}

class Addfinancialsuccess extends financialState {
  final String success_message;

  Addfinancialsuccess({required this.success_message});
}

class Addfinancialfailure extends financialState {
  final String error_message;

  Addfinancialfailure({required this.error_message});
}
