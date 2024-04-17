import 'package:ghhg/features/emoloyees/data/repos/addemployeerepoimplementation.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/employeemodel/datum.dart';

class showemployeescuibt extends Cubit<showemployeesstates> {
  final emplyeerepoimplementaion employeerepo;
  showemployeescuibt({required this.employeerepo})
      : super(showemployeesintial());
  List<Datum> employeesdata = [];
  int page = 1;
  getallemployees({required String token, required int page}) async {
    this.page = 1;
    emit(showemployeesloading());
    var result = await employeerepo.getemployees(token: token, page: page);
    result.fold((l) {
      emit(showemployeesfailure(error_message: l.error_message));
    }, (r) {
      employeesdata.clear();

      employeesdata.addAll(r.data!);
      emit(showemployeessuccess());
    });
  }

  deleteemployee({required String token, required int employeenumber}) async {
    var result = await employeerepo.deleteemployee(
        token: token, employeenumber: employeenumber);
    result.fold((failure) {
      emit(deleteemployeefailure(errormessage: failure.error_message));
    }, (success) {
      employeesdata.removeWhere((element) => element.id == employeenumber);
      emit(deleteemployeesuccess(succes_message: success));
    });
  }

  searchforemployee(String phone, String cardnumber) {
    if (phone.isNotEmpty) {
      employeesdata.removeWhere((element) => element.phone != phone);
    }
    if (cardnumber.isNotEmpty) {
      employeesdata.removeWhere((element) => element.cardNumber != cardnumber);
    }
    emit(deleteemployeesuccess(succes_message: ""));
  }
}
