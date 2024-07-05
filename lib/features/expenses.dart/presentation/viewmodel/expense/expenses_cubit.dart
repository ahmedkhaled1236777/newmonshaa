import 'package:ghhg/features/expenses.dart/data/models/expensemodel/datum.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodelupdate.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:ghhg/features/expenses.dart/data/repos/expenserepoimplementation.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class expenseCubit extends Cubit<expenseState> {
  final expenserepoimplementation expenserepo;
  num? total;
  expenseCubit(this.expenserepo) : super(expenseInitial());
  List<String> headertabel = [
    "المبلغ",
    "الوصف",
    "التاريخ",
    "تعديل",
    "حذف",
  ];
  Map<String, dynamic>? queryParameters;
  List<Datum> expensedata = [];
  bool loading = false;
  int page = 1;
  addexpense(
      {required String token, required expensesmodelrequest expense}) async {
    emit(Addexpenseloading());
    var result = await expenserepo.addexpense(token: token, expense: expense);
    result.fold((failure) {
      emit(Addexpensefailure(error_message: failure.error_message));
    }, (success) {
      emit(Addexpensesuccess(success_message: success));
    });
  }

  getallmoreexpenses({
    required String token,
  }) async {
    page++;
    var result = await expenserepo.getexpenses(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showexpensefailure(errorr_message: l.error_message));
    }, (r) {
      expensedata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showexpensesuccess());
    });
  }

  getallexpenses({required String token, required int page}) async {
    this.page = 1;
    emit(showexpenseloadin());
    var result = await expenserepo.getexpenses(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showexpensefailure(errorr_message: l.error_message));
    }, (r) {
      total = r.total;
      expensedata.clear();

      expensedata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showexpensesuccess());
    });
  }

  deleteexpense({required String token, required int expenseid,required num expense}) async {
    emit(deleteexpenseloading());
    var result =
        await expenserepo.deleteexpense(token: token, expenseid: expenseid);
    result.fold((failure) {
      emit(deleteexpensefailure(errormessage: failure.error_message));
    }, (success) {
              total=total!-expense;

      expensedata.removeWhere((element) {
return   element.id == expenseid;
      }
      
     );
      emit(deleteexpensesuccess(success_message: success));
    });
  }

  updateexpense(
      {required String token,
      required int id,
      required expensesmodelupdaterequest expensemodel}) async {
    emit(editexpenseloading());
    var result = await expenserepo.editexpense(
        token: token, id: id, expensemodel: expensemodel);
    result.fold((failure) {
      emit(editexpensefailure(error_message: failure.error_message));
    }, (success) {
      emit(editexpensesuccess(success_message: success));
    });
  }
}
