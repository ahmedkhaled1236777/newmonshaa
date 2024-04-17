import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/data/repo/revenusreportsrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../revenus/data/model/revenumodel/datum.dart';

part 'revenusreports_state.dart';

class revenusatreportsCubit extends Cubit<revenusatreportsState> {
  final showrevenusrepoimplementationreports showrevenusrepo;
  revenusatreportsCubit(this.showrevenusrepo)
      : super(revenusatreportsInitial());

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  List mobileheadertabeleallrevenusatreportss = [
    "اسم الموظف",
    "المبلغ ",
    "الوصف",
    "التاريخ",
  ];

  int page = 1;
  bool loading = false;
  getallrevenusat({
    required String token,
    required int page,
  }) async {
    emit(revenusatreportsloading());
    this.page = 1;
    var result = await showrevenusrepo.showrevenus(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(revenusatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(revenusatreportssuccess());
    });
  }

  getamorellrevenusat({required String token}) async {
    page++;
    var result = await showrevenusrepo.showrevenus(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(revenusatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(revenusatreportssuccess());
    });
  }
}
