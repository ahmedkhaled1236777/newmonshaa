import 'package:ghhg/features/reports/presentation/view/profitsreports/data/repo/profitrepoimp.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/profitmodel/data.dart';

part 'profit_state.dart';

class profitatreportsCubit extends Cubit<profitatreportsState> {
  final showprofitrepoimplementationreports showprofitrepo;
  profitatreportsCubit(this.showprofitrepo) : super(profitatreportsInitial());

  bool search = true;
  Data? data;
  Map<String, dynamic>? queryParameters;
  List mobileheadertabeleallprofitatreportss = [
    "اجمالى الايرادات",
    "اجمالى المصروفات",
    "الارباح",
    "التاريخ",
  ];

  getallprofitat({
    required String token,
  }) async {
    emit(profitatreportsloading());
    var result = await showprofitrepo.showprofit(
        token: token, queryParameters: queryParameters);
    result.fold((failue) {
      emit(profitatreportsfailure(error_message: failue.error_message));
    }, (success) {
      data = success.data;
      emit(profitatreportssuccess());
    });
  }
}
