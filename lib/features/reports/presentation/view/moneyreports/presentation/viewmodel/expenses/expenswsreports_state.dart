part of 'expenswsreports_cubit.dart';

abstract class moneyatreportsState {}

class moneyatreportsInitial extends moneyatreportsState {}

class moneyatreportsloading extends moneyatreportsState {}

class moneyatreportssuccess extends moneyatreportsState {}

class moneyatreportsfailure extends moneyatreportsState {
  final String error_message;

  moneyatreportsfailure({required this.error_message});
}
