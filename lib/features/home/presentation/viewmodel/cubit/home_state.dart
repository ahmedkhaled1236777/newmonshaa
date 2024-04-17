part of 'home_cubit.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class Homesuccess extends HomeState {}

class resetcounterstate extends HomeState {}

class Homefailure extends HomeState {
  final String error_message;

  Homefailure({required this.error_message});
}
