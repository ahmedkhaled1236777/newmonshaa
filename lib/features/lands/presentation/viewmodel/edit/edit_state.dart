part of 'edit_cubit.dart';

class EditlandState {}

class EditlandInitial extends EditlandState {}

class editlandloading extends EditlandState {}

class editlandsuccess extends EditlandState {
  final String successmessage;

  editlandsuccess({required this.successmessage});
}

class editlandfailure extends EditlandState {
  final String error_message;

  editlandfailure({required this.error_message});
}

class editlandchangeadvistortype extends EditlandState {}
