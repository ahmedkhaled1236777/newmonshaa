import 'package:ghhg/features/reports/presentation/view/moneyreports/data/repos/moneyreportsrepoimplementation.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../../expenses.dart/data/models/expensemodel/datum.dart';

part 'expenswsreports_state.dart';

class moneyatreportsCubit extends Cubit<moneyatreportsState> {
  num? total;
  final showmoneyrepoimplementationreports showmoneyrepo;
  moneyatreportsCubit(this.showmoneyrepo) : super(moneyatreportsInitial());

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  List mobileheadertabeleallmoneyatreportss = [
    "اسم الموظف",
    "المبلغ",
    "الوصف",
    "التاريخ",
  ];

  int page = 1;
  bool loading = false;
  getallmoneyat({
    required String token,
    required int page,
  }) async {
    emit(moneyatreportsloading());
    this.page = 1;
    var result = await showmoneyrepo.showmoney(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(moneyatreportsfailure(error_message: failue.error_message));
    }, (success) {
      total = success.total;
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(moneyatreportssuccess());
    });
  }

  getamorellmoneyat({required String token}) async {
    page++;
    var result = await showmoneyrepo.showmoney(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(moneyatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(moneyatreportssuccess());
    });
  }
}
