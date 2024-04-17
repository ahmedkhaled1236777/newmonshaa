part of 'profit_cubit.dart';

abstract class profitatreportsState {}

class profitatreportsInitial extends profitatreportsState {}

class profitatreportsloading extends profitatreportsState {}

class profitatreportssuccess extends profitatreportsState {}

class profitatreportsfailure extends profitatreportsState {
  final String error_message;

  profitatreportsfailure({required this.error_message});
}
