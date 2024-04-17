import 'package:ghhg/features/revenus/data/model/revenuesmodelupdaterequest.dart';
import 'package:ghhg/features/revenus/data/model/revenumodelrequest.dart';
import 'package:ghhg/features/revenus/data/repos/revenurepoimplementation.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/revenumodel/datum.dart';

class revenueCubit extends Cubit<revenueState> {
  final revenuerepoimplementation revenuerepo;
  revenueCubit(this.revenuerepo) : super(revenueInitial());
  List<String> headertabel = [
    "المبلغ",
    "الوصف",
    "التاريخ",
    "تعديل",
    "حذف",
  ];
  String? desctype;
  Map<String, dynamic>? queryParameters;
  List<Datum> revenuedata = [];
  bool loading = false;
  int page = 1;
  changedesctype(String val) {
    desctype = val;
    emit(changedescstate());
  }

  cleardesctype() {
    desctype = null;
    emit(changedescstate());
  }

  addrevenue(
      {required String token, required revenuesmodelrequest revenue}) async {
    emit(Addrevenueloading());
    var result = await revenuerepo.addrevenue(token: token, revenue: revenue);
    result.fold((failure) {
      emit(Addrevenuefailure(error_message: failure.error_message));
    }, (success) {
      emit(Addrevenuesuccess(success_message: success));
    });
  }

  getallmorerevenues({
    required String token,
  }) async {
    page++;
    var result = await revenuerepo.getrevenues(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showrevenuefailure(errorr_message: l.error_message));
    }, (r) {
      revenuedata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showrevenuesuccess());
    });
  }

  getallrevenues({required String token, required int page}) async {
    this.page = 1;
    emit(showrevenueloadin());
    var result = await revenuerepo.getrevenues(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showrevenuefailure(errorr_message: l.error_message));
    }, (r) {
      revenuedata.clear();

      revenuedata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showrevenuesuccess());
    });
  }

  deleterevenue({required String token, required int revenueid}) async {
    var result =
        await revenuerepo.deleterevenue(token: token, revenueid: revenueid);
    result.fold((failure) {
      emit(deleterevenuefailure(errormessage: failure.error_message));
    }, (success) {
      revenuedata.removeWhere((element) => element.id == revenueid);
      emit(deleterevenuesuccess(succes_message: success));
    });
  }

  updaterevenue(
      {required String token,
      required int id,
      required revenuesmodelupdaterequest revenuemodel}) async {
    emit(editrevenueloading());
    var result = await revenuerepo.editrevenue(
        token: token, id: id, revenuemodel: revenuemodel);
    result.fold((failure) {
      emit(editrevenuefailure(error_message: failure.error_message));
    }, (success) {
      emit(editrevenuesuccess(success_message: success));
    });
  }
}
