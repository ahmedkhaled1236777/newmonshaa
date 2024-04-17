import 'package:ghhg/features/contracts/data/models/contractmodel/datum.dart';
import 'package:ghhg/features/finishedcontracts/data/repos/finishedcontractsrepoimplementation.dart';
import 'package:ghhg/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class finishedcontractsCubit extends Cubit<finishedcontractsState> {
  finishedcontractsCubit(this.finishedcontractsrepo)
      : super(finishedcontractsInitial());
  final finishedconreactsrepoimplementation finishedcontractsrepo;

  List<String> headertabeleallfinishedcontractss = [
    "عنوان العقار",
    "المالك",
    "هاتف المالك",
    " المستأجر",
    "هاتف المستأجر",
    "قيمة الايجار",
    "تاريخ الانتهاء",
    "حذف"
  ];
  List<String> mobileheadertabeleallfinishedcontractss = [
    "عنوان العقار",
    "المالك",
    "هاتف المالك",
    " المستأجر",
    "تاريخ الانتهاء",
    "حذف"
  ];
  Map<String, dynamic>? queryParameters;
  bool loading = false;
  int page = 1;
  int? id;
  List<Datum> myfinishedcontractss = [];

  getallmorefinishedcontractss({
    required String token,
  }) async {
    page++;
    var result =
        await finishedcontractsrepo.getcontracts(token: token, page: page);
    loading = true;
    result.fold((l) {
      emit(showfinishedcontractsfailure(errorr_message: l.error_message));
    }, (r) {
      myfinishedcontractss.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showfinishedcontractssuccess());
    });
  }

  getallfinishedcontractss({required String token, required int page}) async {
    this.page = 1;
    emit(showfinishedcontractsloadin());
    var result =
        await finishedcontractsrepo.getcontracts(token: token, page: page);
    loading = true;
    result.fold((l) {
      emit(showfinishedcontractsfailure(errorr_message: l.error_message));
    }, (r) {
      myfinishedcontractss.clear();

      myfinishedcontractss.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showfinishedcontractssuccess());
    });
  }

  deletefinishedcontracts(
      {required String token, required int finishedcontractsid}) async {
    var result = await finishedcontractsrepo.deletecontract(
        token: token, contractid: finishedcontractsid);
    result.fold((failure) {
      emit(deletefinishedcontractsfailure(errormessage: failure.error_message));
    }, (success) {
      myfinishedcontractss
          .removeWhere((element) => element.id == finishedcontractsid);
      emit(deletefinishedcontractssuccess(succes_message: success));
    });
  }
}
