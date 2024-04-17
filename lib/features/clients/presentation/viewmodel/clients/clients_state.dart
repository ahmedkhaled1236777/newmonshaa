abstract class clientsState {}

class clientsInitial extends clientsState {}

class editclientsloading extends clientsState {}

class editclientssuccess extends clientsState {
  final String success_message;

  editclientssuccess({required this.success_message});
}

class editclientsfailure extends clientsState {
  final String error_message;

  editclientsfailure({required this.error_message});
}

class showclientsloadin extends clientsState {}

class deleteclientssuccess extends clientsState {
  final String successmessage;

  deleteclientssuccess({required this.successmessage});
}

class deleteclientsfailure extends clientsState {
  final String errormessage;

  deleteclientsfailure({required this.errormessage});
}

class showclientssuccess extends clientsState {}

class changestatusstate extends clientsState {}

class showclientsfailure extends clientsState {
  final String errorr_message;

  showclientsfailure({required this.errorr_message});
}

class Addclientsloading extends clientsState {}

class Addclientssuccess extends clientsState {
  final String success_message;

  Addclientssuccess({required this.success_message});
}

class Addclientsfailure extends clientsState {
  final String error_message;

  Addclientsfailure({required this.error_message});
}
