import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodel/datum.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodelrequest.dart';
import 'package:ghhg/features/employeecomission/data/repos/employeecomrepoimp.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecomstate.dart';

class employeecomCubit extends Cubit<employeecomState> {
  final employeecomrepoimplementation employeecomrepo;
  employeecomCubit(this.employeecomrepo) : super(employeecomInitial());
  num? total;
  String? desctype;
  Map<String, dynamic>? queryParameters;
  List<Datum> employeecomdata = [];
  bool loading = false;
  int page = 1;
  List<String> headertabel = [
    "اسم الموظف",
    "المبلغ",
    "الوصف",
    "التاريخ",
    "تعديل",
    "حذف",
  ];
  changedesctype(String val) {
    desctype = val;
    emit(changedescstate());
  }

  cleardesctype() {
    desctype = null;
    emit(changedescstate());
  }

  addemployeecom(
      {required String token,
      required employeecommodelrequest employeecom}) async {
    emit(Addemployeecomloading());
    var result = await employeecomrepo.addemployeecom(
        token: token, employeecom: employeecom);
    result.fold((failure) {
      emit(Addemployeecomfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addemployeecomsuccess(success_message: success));
    });
  }

  getallmoreemployeecoms({
    required String token,
  }) async {
    page++;
    var result = await employeecomrepo.getemployeecoms(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showemployeecomfailure(errorr_message: l.error_message));
    }, (r) {
      employeecomdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showemployeecomsuccess());
    });
  }

  getallemployeecoms({required String token, required int page}) async {
    this.page = 1;
    emit(showemployeecomloadin());
    var result = await employeecomrepo.getemployeecoms(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showemployeecomfailure(errorr_message: l.error_message));
    }, (r) {
      total = r.total;
      employeecomdata.clear();

      employeecomdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showemployeecomsuccess());
    });
  }

  deleteemployeecom({required String token, required int employeecomid,required num employeecom}) async {
    emit(deleteemployeecomloading());
    var result = await employeecomrepo.deleteemployeecom(
        token: token, employeecomid: employeecomid);
    result.fold((failure) {
      emit(deleteemployeecomfailure(errormessage: failure.error_message));
    }, (success) {
      total=total!-employeecom;
      employeecomdata.removeWhere((element) => element.id == employeecomid);
      emit(deleteemployeecomsuccess(succes_message: success));
    });
  }

  updateemployeecom(
      {required String token,
      required int id,
      required employeecommodelrequest employeecommodel}) async {
    emit(editemployeecomloading());
    var result = await employeecomrepo.editemployeecom(
        token: token, id: id, employeecommodel: employeecommodel);
    result.fold((failure) {
      emit(editemployeecomfailure(error_message: failure.error_message));
    }, (success) {
      emit(editemployeecomsuccess(success_message: success));
    });
  }
}
