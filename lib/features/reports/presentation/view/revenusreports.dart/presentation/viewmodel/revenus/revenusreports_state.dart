part of 'revenusreports_cubit.dart';

abstract class revenusatreportsState {}

class revenusatreportsInitial extends revenusatreportsState {}

class revenusatreportsloading extends revenusatreportsState {}

class revenusatreportssuccess extends revenusatreportsState {}

class revenusatreportsfailure extends revenusatreportsState {
  final String error_message;

  revenusatreportsfailure({required this.error_message});
}
