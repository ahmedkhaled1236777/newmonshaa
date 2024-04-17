part of 'edit_cubit.dart';

class EditState {}

class EditInitial extends EditState {}

class editloading extends EditState {}

class editsuccess extends EditState {
  final String successmessage;

  editsuccess({required this.successmessage});
}

class editfailure extends EditState {
  final String error_message;

  editfailure({required this.error_message});
}

class editchangetype extends EditState {}

class editchangeemployeename extends EditState {}

class editchangedepartement extends EditState {}

class editchangeadvistortype extends EditState {}
