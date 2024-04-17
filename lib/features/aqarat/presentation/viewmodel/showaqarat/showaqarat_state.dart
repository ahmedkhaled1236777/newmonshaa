part of 'showaqarat_cubit.dart';

abstract class ShowaqaratState {}

class ShowaqaratInitial extends ShowaqaratState {}

class getmore extends ShowaqaratState {}

class Showaqaratloading extends ShowaqaratState {}

class Showaqaratsuccess extends ShowaqaratState {}

class Showaqaratfailure extends ShowaqaratState {
  final String error_message;

  Showaqaratfailure({required this.error_message});
}

class deleteaqarsuccess extends ShowaqaratState {
  final String successmessage;

  deleteaqarsuccess({required this.successmessage});
}

class deleteaqarfailure extends ShowaqaratState {
  final String error_message;

  deleteaqarfailure({required this.error_message});
}
