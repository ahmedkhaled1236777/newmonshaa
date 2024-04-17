abstract class recieptState {}

class recieptInitial extends recieptState {}

class recieptchangecontrollers extends recieptState {}

class editrecieptloading extends recieptState {}

class editrecieptsuccess extends recieptState {
  final String success_message;

  editrecieptsuccess({required this.success_message});
}

class editrecieptfailure extends recieptState {
  final String error_message;

  editrecieptfailure({required this.error_message});
}

class showrecieptloadin extends recieptState {}

class deleterecieptsuccess extends recieptState {
  final String succes_message;

  deleterecieptsuccess({required this.succes_message});
}

class deleterecieptfailure extends recieptState {
  final String errormessage;

  deleterecieptfailure({required this.errormessage});
}

class showrecieptsuccess extends recieptState {}

class showrecieptfailure extends recieptState {
  final String errorr_message;

  showrecieptfailure({required this.errorr_message});
}

class Addrecieptloading extends recieptState {}

class Addrecieptsuccess extends recieptState {
  final String success_message;

  Addrecieptsuccess({required this.success_message});
}

class Addrecieptfailure extends recieptState {
  final String error_message;

  Addrecieptfailure({required this.error_message});
}
