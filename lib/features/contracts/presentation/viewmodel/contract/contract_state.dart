abstract class contractState {}

class contractInitial extends contractState {}

class changecommison extends contractState {}

class changetype extends contractState {}

class cleardatastate extends contractState {}

class getmoneystate extends contractState {}

class deletecontractloading extends contractState {}

class editcontractloading extends contractState {}

class editcontractsuccess extends contractState {
  final String success_message;

  editcontractsuccess({required this.success_message});
}

class editcontractfailure extends contractState {
  final String error_message;

  editcontractfailure({required this.error_message});
}

class showcontractloadin extends contractState {}

class deletecontractsuccess extends contractState {
  final String success_message;

  deletecontractsuccess({required this.success_message});
}

class deletecontractfailure extends contractState {
  final String errormessage;

  deletecontractfailure({required this.errormessage});
}

class showcontractsuccess extends contractState {}

class showcontractfailure extends contractState {
  final String errorr_message;

  showcontractfailure({required this.errorr_message});
}

class Addcontractloading extends contractState {}

class Addcontractsuccess extends contractState {
  final String success_message;

  Addcontractsuccess({required this.success_message});
}

class Addcontractfailure extends contractState {
  final String error_message;

  Addcontractfailure({required this.error_message});
}
