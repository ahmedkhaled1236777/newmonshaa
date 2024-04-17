part of 'showlands_cubit.dart';

abstract class ShowlandsState {}

class ShowlandsInitial extends ShowlandsState {}

class getmore extends ShowlandsState {}

class Showlandsloading extends ShowlandsState {}

class Showlandssuccess extends ShowlandsState {}

class Showlandsfailure extends ShowlandsState {
  final String error_message;

  Showlandsfailure({required this.error_message});
}

class deletelandsloading extends ShowlandsState {}

class deletelandssuccess extends ShowlandsState {
  final String successmessage;

  deletelandssuccess({required this.successmessage});
}

class deletelandsfailure extends ShowlandsState {
  final String error_message;

  deletelandsfailure({required this.error_message});
}
