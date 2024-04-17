part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class Profileloading extends ProfileState {}

class Profilesuccess extends ProfileState {}

class Profilefailure extends ProfileState {
  final String error_message;

  Profilefailure({required this.error_message});
}
