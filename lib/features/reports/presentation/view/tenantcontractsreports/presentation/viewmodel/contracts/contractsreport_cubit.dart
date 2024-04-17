import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/data/repos/contractsreportsimp.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../contracts/data/models/contractmodel/datum.dart';

part 'contractsreport_state.dart';

class contractsatreportsCubit extends Cubit<contractsatreportsState> {
  final showcontractsrepoimplementationreports showcontractsrepo;
  contractsatreportsCubit(this.showcontractsrepo)
      : super(contractsatreportsInitial());

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  List mobileheadertabeleallcontractsatreportss = [
    "عنوان العقار",
    "اسم المالك",
    "هاتف المالك",
    "قيمة الايجار",
    "التاريخ",
  ];
  List headertabeleallcontractsatreportss = [
    "عنوان العقار",
    "اسم المالك",
    "هاتف المالك",
    "اسم المستاجر",
    "هاتف المستأجر",
    "قيمة الايجار",
    "التاريخ",
  ];

  int page = 1;
  bool loading = false;
  getallcontractsat({
    required String token,
    required int page,
  }) async {
    emit(contractsatreportsloading());
    this.page = 1;
    var result = await showcontractsrepo.showcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(contractsatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(contractsatreportssuccess());
    });
  }

  getamorellcontractsat({required String token}) async {
    page++;
    var result = await showcontractsrepo.showcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(contractsatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(contractsatreportssuccess());
    });
  }
}
