part of 'contractsreport_cubit.dart';

abstract class contractsatreportsState {}

class contractsatreportsInitial extends contractsatreportsState {}

class contractsatreportsloading extends contractsatreportsState {}

class contractsatreportssuccess extends contractsatreportsState {}

class contractsatreportsfailure extends contractsatreportsState {
  final String error_message;

  contractsatreportsfailure({required this.error_message});
}
