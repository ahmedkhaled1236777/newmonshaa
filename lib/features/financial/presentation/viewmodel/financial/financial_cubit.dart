import 'package:ghhg/features/financial/data/model/financialmodelrequest.dart';
import 'package:ghhg/features/financial/data/repos/financialrepoimplementation.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/financialmodel/datum.dart';
import '../../../data/model/financialmodel/receipt.dart';

class financialCubit extends Cubit<financialState> {
  final financialrepoimplementation financialrepo;
  TextEditingController tenantname = TextEditingController();
  List<Receipt> myreciepts = [];

  TextEditingController ownername = TextEditingController();
  TextEditingController amountofmoney = TextEditingController();
  financialCubit(this.financialrepo) : super(financialInitial());
  givefinancialdata(Datum data) {
    print("wdwwddddddddddddddddwddddddddddddddddd");
    print(data);
    tenantname = TextEditingController(text: data.tenant!);
    ownername = TextEditingController(text: data.ownerName!);
    amountofmoney = TextEditingController(text: data.contractTotal.toString());
    emit(financialchangecontrollers());
  }

  clearcontrollers() {
    tenantname.clear();
    ownername.clear();
    amountofmoney.clear();
    emit(financialchangecontrollers());
  }

  List<String> headertabel = [
    "اسم المستأجر",
    "اسم المالك",
    "عنوان العقار",
    "قيمة القسط",
    "قبض",
  ];
  List<String> headertabeleallfinancials = [
    "رقم القسط",
    "اسم المستأجر",
    "هاتف المستأجر",
    "قيمة القسط",
    "الايجار من",
    "الايجار الي",
    "التاريخ",
    "طباعه",
    "حذف",
  ];
  List<String> mobileheadertabeleallfinancials = [
    "رقم القسط",
    "اسم المستأجر",
    "قيمة القسط",
    "التاريخ",
    "طباعه",
    "حذف",
  ];
  Map<String, dynamic>? queryParameters;
  bool loading = false;
  int page = 1;
  int? id;
  List<Datum> myfinancials = [];
  addfinancial(
      {required String token,
      required financialmodelrequest financial,
      required int id}) async {
    emit(Addfinancialloading());
    var result = await financialrepo.addfinancial(
        token: token, financial: financial, id: id);
    result.fold((failure) {
      emit(Addfinancialfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addfinancialsuccess(success_message: success));
    });
  }

  getallmorefinancials({
    required String token,
  }) async {
    page++;
    var result = await financialrepo.getfinancials(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showfinancialfailure(errorr_message: l.error_message));
    }, (r) {
      myfinancials.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showfinancialsuccess());
    });
  }

  getallfinancials({required String token, required int page}) async {
    this.page = 1;
    emit(showfinancialloadin());
    var result = await financialrepo.getfinancials(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showfinancialfailure(errorr_message: l.error_message));
    }, (r) {
      myfinancials.clear();

      myfinancials.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showfinancialsuccess());
    });
  }

  deletefinancial({required String token, required int financialid}) async {
    emit(deletefinancialloading());
    var result = await financialrepo.deletefinancial(
        token: token, financialid: financialid);
    result.fold((failure) {
      emit(deletefinancialfailure(errormessage: failure.error_message));
    }, (success) {
      myreciepts.removeWhere((element) => element.id == financialid);
      emit(deletefinancialsuccess(succes_message: success));
    });
  }

  dispose() {
    tenantname.clear();

    ownername.clear();
    amountofmoney.clear();
  }
}
