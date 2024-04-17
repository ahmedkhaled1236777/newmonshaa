part of 'landsreports_cubit.dart';

abstract class landatreportsState {}

class landatreportsInitial extends landatreportsState {}

class landatreportsloading extends landatreportsState {}

class landatreportssuccess extends landatreportsState {}

class landatreportsfailure extends landatreportsState {
  final String error_message;

  landatreportsfailure({required this.error_message});
}
