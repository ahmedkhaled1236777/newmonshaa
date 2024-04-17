import 'package:ghhg/features/reciept/data/models/allrecieptmodel/allrecieptmodel.dart';
import 'package:ghhg/features/reciept/data/models/recieptmodelrequest.dart';
import 'package:ghhg/features/reciept/data/repos/recieptrepoimplementation.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/allrecieptmodel/datum.dart';
import '../../../data/models/allrecieptmodel/receipt.dart';

class recieptCubit extends Cubit<recieptState> {
  List<Receipt> reciepts = [];

  final recieptrepoimplementation recieptrepo;
  TextEditingController tenantname = TextEditingController();
  Allrecieptmodel? allrecieptmodel;
  TextEditingController ownername = TextEditingController();
  TextEditingController amountofmoney = TextEditingController();
  TextEditingController companyamola = TextEditingController();
  recieptCubit(this.recieptrepo) : super(recieptInitial());
  giverecieptdata(Datum data) {
    tenantname = TextEditingController(text: data.tenant!!);
    ownername = TextEditingController(text: data.ownerName!);
    amountofmoney = TextEditingController(text: data.contractTotal.toString());
    emit(recieptchangecontrollers());
  }

  clearcontrollers() {
    tenantname.clear();
    ownername.clear();
    amountofmoney.clear();
    companyamola.clear();
    emit(recieptchangecontrollers());
  }

  List<String> headertabel = [
    "اسم المستأجر",
    "اسم المالك",
    "عنوان العقار",
    "قيمة القسط",
    "صرف",
  ];
  List<String> headertabeleallreciepts = [
    "رقم القسط",
    "اسم المالك",
    "هاتف المالك",
    "قيمة القسط",
    "الايجار من",
    "الايجار الي",
    "التاريخ",
    "طباعه",
    "حذف",
  ];
  List<String> mobileheadertabeleallreciepts = [
    "رقم القسط",
    "اسم المالك",
    "قيمة القسط",
    "التاريخ",
    "طباعه",
    "حذف",
  ];
  Map<String, dynamic>? queryParameters;
  bool loading = false;
  int page = 1;
  int? id;
  List<Datum> myreciepts = [];
  addreciept(
      {required String token,
      required recieptsmodelrequest reciept,
      required int id}) async {
    emit(Addrecieptloading());
    var result =
        await recieptrepo.addreciept(token: token, reciept: reciept, id: id);
    result.fold((failure) {
      emit(Addrecieptfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addrecieptsuccess(success_message: success));
    });
  }

  getallmorereciepts({
    required String token,
  }) async {
    page++;
    var result = await recieptrepo.getreciepts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showrecieptfailure(errorr_message: l.error_message));
    }, (r) {
      myreciepts.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showrecieptsuccess());
    });
  }

  getallreciepts({required String token, required int page}) async {
    this.page = 1;
    emit(showrecieptloadin());
    var result = await recieptrepo.getreciepts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showrecieptfailure(errorr_message: l.error_message));
    }, (r) {
      myreciepts.clear();

      myreciepts.addAll(r.data!.data!);
      print(myreciepts);
      if (r.data!.links!.next == null) loading = false;

      emit(showrecieptsuccess());
    });
  }

  deletereciept({required String token, required int recieptid}) async {
    var result =
        await recieptrepo.deletereciept(token: token, recieptid: recieptid);
    result.fold((failure) {
      emit(deleterecieptfailure(errormessage: failure.error_message));
    }, (success) {
      reciepts.removeWhere((element) => element.id == recieptid);
      emit(deleterecieptsuccess(succes_message: success));
    });
  }

  /*updatereciept(
      {required String token,
      required int id,
      required recieptsmodelrequest recieptmodel}) async {
    emit(editrecieptloading());
    var result = await recieptrepo.editreciept(
        token: token, id: id, recieptmodel: recieptmodel);
    result.fold((failure) {
      emit(editrecieptfailure(error_message: failure.error_message));
    }, (success) {
      emit(editrecieptsuccess(success_message: success));
    });
  }*/
  dispose() {
    tenantname.clear();
    companyamola.clear();
    amountofmoney.clear();
    ownername.clear();
  }
}
