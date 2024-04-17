abstract class revenueState {}

class revenueInitial extends revenueState {}

class changedescstate extends revenueState {}

class editrevenueloading extends revenueState {}

class editrevenuesuccess extends revenueState {
  final String success_message;

  editrevenuesuccess({required this.success_message});
}

class editrevenuefailure extends revenueState {
  final String error_message;

  editrevenuefailure({required this.error_message});
}

class showrevenueloadin extends revenueState {}

class deleterevenuesuccess extends revenueState {
  final String succes_message;

  deleterevenuesuccess({required this.succes_message});
}

class deleterevenuefailure extends revenueState {
  final String errormessage;

  deleterevenuefailure({required this.errormessage});
}

class showrevenuesuccess extends revenueState {}

class showrevenuefailure extends revenueState {
  final String errorr_message;

  showrevenuefailure({required this.errorr_message});
}

class Addrevenueloading extends revenueState {}

class Addrevenuesuccess extends revenueState {
  final String success_message;

  Addrevenuesuccess({required this.success_message});
}

class Addrevenuefailure extends revenueState {
  final String error_message;

  Addrevenuefailure({required this.error_message});
}
