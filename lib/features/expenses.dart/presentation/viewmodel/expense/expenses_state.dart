abstract class expenseState {}

class expenseInitial extends expenseState {}

class editexpenseloading extends expenseState {}

class editexpensesuccess extends expenseState {
  final String success_message;

  editexpensesuccess({required this.success_message});
}

class editexpensefailure extends expenseState {
  final String error_message;

  editexpensefailure({required this.error_message});
}

class showexpenseloadin extends expenseState {}

class deleteexpenseloading extends expenseState {}

class deleteexpensesuccess extends expenseState {
  final String success_message;

  deleteexpensesuccess({required this.success_message});
}

class deleteexpensefailure extends expenseState {
  final String errormessage;

  deleteexpensefailure({required this.errormessage});
}

class showexpensesuccess extends expenseState {}

class showexpensefailure extends expenseState {
  final String errorr_message;

  showexpensefailure({required this.errorr_message});
}

class Addexpenseloading extends expenseState {}

class Addexpensesuccess extends expenseState {
  final String success_message;

  Addexpensesuccess({required this.success_message});
}

class Addexpensefailure extends expenseState {
  final String error_message;

  Addexpensefailure({required this.error_message});
}
