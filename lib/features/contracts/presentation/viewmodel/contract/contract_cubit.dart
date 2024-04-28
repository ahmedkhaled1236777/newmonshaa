import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/contracts/data/models/contractmodelrequest.dart';
import 'package:ghhg/features/contracts/data/repos/contractrepoimplementation.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/contractmodel/datum.dart';

class contractCubit extends Cubit<contractState> {
  final contractrepoimplementation contractrepo;
  contractCubit(this.contractrepo) : super(contractInitial());
  List<String> headertabel = [
    "اسم المستأجر",
    "العنوان",
    "رقم الهاتف",
    "طباعة عقد",
    "تعديل",
    "حذف",
  ]; /*
 TextEditingController tenantname=TextEditingController();
 TextEditingController tenanphone=TextEditingController();
 TextEditingController tenantcard=TextEditingController();
 TextEditingController tenantadress=TextEditingController();
 TextEditingController tenantjob=TextEditingController();
 TextEditingController tenantnationality=TextEditingController();
 TextEditingController ownername=TextEditingController();
 TextEditingController ownerphone=TextEditingController();
 TextEditingController ownercard=TextEditingController();
 TextEditingController owneradress=TextEditingController();
 TextEditingController ownerjob=TextEditingController();
 TextEditingController ownernationality=TextEditingController();
 TextEditingController aqaradress=TextEditingController();
 TextEditingController aqaradressdetails=TextEditingController();
 TextEditingController aqarmohafza=TextEditingController();
 TextEditingController area=TextEditingController();
 TextEditingController emaranumber=TextEditingController();
 TextEditingController housenumber=TextEditingController();
 TextEditingController totalvalue=TextEditingController();
 TextEditingController insuranceval=TextEditingController();
 TextEditingController commessionvalue=TextEditingController();
 TextEditingController periodofdelay=TextEditingController();*/
  int? id;
  int?tenantid;
  String? aqartype;
  String? commessiontype;
  cleardata() {
    aqartype = null;
    commessiontype = null;
  }

  String? havemoney;
  getmoney(String val) {
    havemoney = val;
    emit(getmoneystate());
  }

  changecommessiontype(String? val) {
    commessiontype = val;
    emit(changecommison());
  }

  mycleardata() {
    aqartype = null;
    commessiontype = null;
    havemoney = null;

    emit(cleardatastate());
  }
  mycleardatawithoutid() {
    aqartype = null;
    commessiontype = null;
    havemoney = null;

    emit(cleardatastate());
  }

  changeaddaqartype(String val) {
    aqartype = val;
    emit(changetype());
  }

  Map<String, dynamic>? queryParameters;
  List<Datum> contractdata = [];
  bool loading = false;
  int page = 1;
  addcontract(
      {required String token,
      required contractmodelrequest contract,
      int? id}) async {
    emit(Addcontractloading());
    var result = await contractrepo.addcontract(
        token: token, contract: contract, id: id);
    result.fold((failure) {
      emit(Addcontractfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addcontractsuccess(success_message: success));
    });
  }

  getallmorecontracts({
    required String token,
  }) async {
    page++;
    var result = await contractrepo.getcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showcontractfailure(errorr_message: l.error_message));
    }, (r) {
      contractdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showcontractsuccess());
    });
  }

  getallcontracts({required String token, required int page}) async {
    this.page = 1;
    emit(showcontractloadin());
    var result = await contractrepo.getcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showcontractfailure(errorr_message: l.error_message));
    }, (r) {
      contractdata.clear();

      contractdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showcontractsuccess());
    });
  }

  deletecontract({required String token, required int contractid}) async {
    var result =
        await contractrepo.deletecontract(token: token, contractid: contractid);
    result.fold((failure) {
      emit(deletecontractfailure(errormessage: failure.error_message));
    }, (success) {
      contractdata.removeWhere((element) => element.id == contractid);
      emit(deletecontractsuccess(success_message: success));
    });
  }

  updatecontract(
      {required String token,
      Map<String,dynamic>?queryparm,
      required int id,
      required contractmodelrequest contractmodel}) async {
    emit(editcontractloading());
    var result = await contractrepo.editcontract(
      queryparm: queryparm,
        token: token, id: id, contractmodel: contractmodel);
    result.fold((failure) {
      emit(editcontractfailure(error_message: failure.error_message));
    }, (success) {
      emit(editcontractsuccess(success_message: success));
    });
  }
}
