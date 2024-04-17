part of 'aqaratreports_cubit.dart';

abstract class AqaratreportsState {}

class AqaratreportsInitial extends AqaratreportsState {}

class Aqaratreportsloading extends AqaratreportsState {}

class Aqaratreportssuccess extends AqaratreportsState {}

class Aqaratreportsfailure extends AqaratreportsState {
  final String error_message;

  Aqaratreportsfailure({required this.error_message});
}
