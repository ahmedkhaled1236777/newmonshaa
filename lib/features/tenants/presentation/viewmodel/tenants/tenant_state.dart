part of 'tenant_cubit.dart';

abstract class TenantState {}

class TenantInitial extends TenantState {}

class editTenantloading extends TenantState {}

class editTenantsuccess extends TenantState {
  final String success_message;

  editTenantsuccess({required this.success_message});
}

class editTenantfailure extends TenantState {
  final String error_message;

  editTenantfailure({required this.error_message});
}

class showTenantloadin extends TenantState {}

class deleteTenantsuccess extends TenantState {
  final String succes_message;

  deleteTenantsuccess({required this.succes_message});
}

class deleteTenantfailure extends TenantState {
  final String errormessage;

  deleteTenantfailure({required this.errormessage});
}

class showTenantsuccess extends TenantState {}

class showTenantfailure extends TenantState {
  final String errorr_message;

  showTenantfailure({required this.errorr_message});
}

class AddTenantloading extends TenantState {}

class AddTenantsuccess extends TenantState {
  final String success_message;

  AddTenantsuccess({required this.success_message});
}

class AddTenantfailure extends TenantState {
  final String error_message;

  AddTenantfailure({required this.error_message});
}
