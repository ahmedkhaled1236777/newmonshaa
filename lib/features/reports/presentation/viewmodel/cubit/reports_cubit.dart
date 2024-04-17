import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/view/aqaratreports.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/landsreports.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/moneyreports.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/profitreports.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/view/revenusreports.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/contractsreport.dart';
import 'package:bloc/bloc.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
  List reports = [
    {"name": "العقارات", "page": aqaratreports(), "name_en": "states"},
    {"name": "الاراضي", "page": landatreports(), "name_en": "lands"},
    {
      "name": "عقود الايجار",
      "page": contractsatreports(),
      "name_en": "tenant_contracts"
    },
    {"name": "الايرادات", "page": revenusatreports(), "name_en": "revenue"},
    {"name": "المصروفات", "page": moneyatreports(), "name_en": "expenses"},
    {"name": "الارباح", "page": profitatreports(), "name_en": "profits"},
  ];
}
