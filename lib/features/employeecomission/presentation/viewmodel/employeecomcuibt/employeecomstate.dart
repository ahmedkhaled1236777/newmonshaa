abstract class employeecomState {}

class employeecomInitial extends employeecomState {}

class changedescstate extends employeecomState {}

class editemployeecomloading extends employeecomState {}

class editemployeecomsuccess extends employeecomState {
  final String success_message;

  editemployeecomsuccess({required this.success_message});
}

class editemployeecomfailure extends employeecomState {
  final String error_message;

  editemployeecomfailure({required this.error_message});
}

class showemployeecomloadin extends employeecomState {}

class deleteemployeecomsuccess extends employeecomState {
  final String succes_message;

  deleteemployeecomsuccess({required this.succes_message});
}

class deleteemployeecomfailure extends employeecomState {
  final String errormessage;

  deleteemployeecomfailure({required this.errormessage});
}

class showemployeecomsuccess extends employeecomState {}

class showemployeecomfailure extends employeecomState {
  final String errorr_message;

  showemployeecomfailure({required this.errorr_message});
}

class Addemployeecomloading extends employeecomState {}

class Addemployeecomsuccess extends employeecomState {
  final String success_message;

  Addemployeecomsuccess({required this.success_message});
}

class Addemployeecomfailure extends employeecomState {
  final String error_message;

  Addemployeecomfailure({required this.error_message});
}
