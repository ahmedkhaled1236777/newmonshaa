part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class Logoutloading extends LogoutState {}

class Logoutsuccess extends LogoutState {
  final String success_message;

  Logoutsuccess({required this.success_message});
}

class Logoutfailure extends LogoutState {
  final String error_message;

  Logoutfailure({required this.error_message});
}
