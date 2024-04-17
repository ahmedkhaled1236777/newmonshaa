import 'dart:collection';

import 'package:ghhg/features/aqarat/data/models/showstate/datum.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/data/repos/aqaratrepoimplementationreports.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/data/repos/aqaratrepos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'aqaratreports_state.dart';

class AqaratreportsCubit extends Cubit<AqaratreportsState> {
  final showaqqarrepoimplementationreports showaqarrepo;
  AqaratreportsCubit(this.showaqarrepo) : super(AqaratreportsInitial());

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  List mobileheadertabeleallaqaratreportss = [
    "اسم الموظف",
    "العنوان ",
    "القسم",
    "النوع",
    "التاريخ",
  ];
  List headertabeleallaqaratreportss = [
    "اسم الموظف",
    "العنوان ",
    "القسم",
    "السعر",
    "النوع",
    "اسم المعلن",
    "هاتف المعلن",
    "نوع المعلن",
    "المساحه",
    "التاريخ",
  ];

  int page = 1;
  bool loading = false;
  getallaqarat({
    required String token,
    required int page,
  }) async {
    emit(Aqaratreportsloading());
    this.page = 1;
    var result = await showaqarrepo.showaqar(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Aqaratreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(Aqaratreportssuccess());
    });
  }

  getamorellaqarat({required String token}) async {
    page++;
    var result = await showaqarrepo.showaqar(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Aqaratreportsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(Aqaratreportssuccess());
    });
  }
}
