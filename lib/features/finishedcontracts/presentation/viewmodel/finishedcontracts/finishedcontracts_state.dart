abstract class finishedcontractsState {}

class finishedcontractsInitial extends finishedcontractsState {}

class showfinishedcontractsloadin extends finishedcontractsState {}

class deletefinishedcontractsloading extends finishedcontractsState {}

class deletefinishedcontractssuccess extends finishedcontractsState {
  final String succes_message;

  deletefinishedcontractssuccess({required this.succes_message});
}

class deletefinishedcontractsfailure extends finishedcontractsState {
  final String errormessage;

  deletefinishedcontractsfailure({required this.errormessage});
}

class showfinishedcontractssuccess extends finishedcontractsState {}

class showfinishedcontractsfailure extends finishedcontractsState {
  final String errorr_message;

  showfinishedcontractsfailure({required this.errorr_message});
}
