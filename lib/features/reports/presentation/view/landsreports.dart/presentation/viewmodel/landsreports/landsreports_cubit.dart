import 'package:ghhg/features/reports/presentation/view/landsreports.dart/data/repos/landsreportsrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../lands/data/models/showlands/datum.dart';

part 'landsreports_state.dart';

class landatreportsCubit extends Cubit<landatreportsState> {
  final showlandrepoimplementationreports showlandrepo;
  landatreportsCubit(this.showlandrepo) : super(landatreportsInitial());

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  List mobileheadertabelealllandatreportss = [
    "اسم الموظف",
    "العنوان ",
    "المساحه",
    "سعر المتر",
    "التاريخ",
  ];
  List headertabelealllandatreportss = [
    "اسم الموظف",
    "العنوان ",
    "المساحه",
    "سعر المتر",
    "التكلفه",
    "اسم المعلن",
    "هاتف المعلن",
    "نوع المعلن",
    "التاريخ",
  ];

  int page = 1;
  bool loading = false;
  getalllandat({
    required String token,
    required int page,
  }) async {
    emit(landatreportsloading());
    this.page = 1;
    var result = await showlandrepo.showland(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(landatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(landatreportssuccess());
    });
  }

  getamorelllandat({required String token}) async {
    page++;
    var result = await showlandrepo.showland(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(landatreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(landatreportssuccess());
    });
  }
}
