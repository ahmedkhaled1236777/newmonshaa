import 'dart:io';

import 'package:ghhg/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:ghhg/features/emoloyees/data/repos/addemployeerepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'addemployee_state.dart';

class AddemployeeCubit extends Cubit<AddemployeeState> {
  final emplyeerepoimplementaion addemployeerepo;
  AddemployeeCubit({required this.addemployeerepo})
      : super(AddemployeeInitial());
  File? image;
  String? is_active;
  uploadimage() async {
    XFile? pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage!.path);
      emit(changeprofileimage());
    }
  }

  resetimage() {
    image = null;
    emit(changeprofileimage());
  }

  bool loading = false;
  List headertable = [
    "اسم الموظف",
    "العنوان",
    "الوظيفه",
    "رقم الهاتف",
    "تعديل",
    "حذف"
  ];
  Map permessions = {
    "العقارات": "states",
    "الاراضي": "lands",
    "المستاجرين": "tenants",
    "عقود الايجار": "tenant_contracts",
    "سندات القبض": "financial_cash",
    "سندات الصرف": "financial_receipt",
    "المصروفات": "expenses",
    "الموظفين": "employees",
    "الدعم الفني": "technical_support",
    "عقارات البيع": "selling_states",
    "عقارات الايجار": "tenant_states",
    "الايرادات": "revenue",
    "العملاء": "clients",
    "العقود المنتهيه": "expired_contracts",
    "الارباح": "profits",
    "عموله الموظفين": "employee_commission"
  };
  Map showpermessions = {
    "states": "العقارات",
    "lands": "الاراضي",
    "tenants": "المستاجرين",
    "tenant_contracts": "عقود الايجار",
    "financial_cash": "سندات القبض",
    "financial_receipt": "سندات الصرف",
    "expenses": "المصروفات",
    "employees": "الموظفين",
    "reports": "التقارير",
    "technical_support": "الدعم الفني",
    "selling_states": "عقارات البيع",
    "tenant_states": "عقارات الايجار",
    "revenue": "الايرادات",
    "clients": "العملاء",
    "notifications": "الاشعارات",
    "expired_contracts": "العقود المنتهيه",
    "profits": "الارباح",
    "employee_commission": "عموله الموظفين"
  };
  List selecteditems = [];
  getselecteditems() {
    List<String> employeepermession = [];
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == "العقارات") {
        employeepermession.add(permessions["عقارات البيع"]);
        employeepermession.add(permessions["عقارات الايجار"]);
      }
      if (selecteditems[i] == "الاشعارات" || selecteditems[i] == "التقارير") {
        continue;
      }
      employeepermession.add(permessions[selecteditems[i]]);
    }
    return employeepermession;
  }

  showselecteditems(List<String> permessions) {
    selecteditems = [];
    for (int i = 0; i < permessions.length; i++) {
      if (permessions[i] != "home_page" &&
          permessions[i] != "setting" &&
          permessions[i] != "notifications" &&
          permessions[i] != "reports" &&
          permessions[i] != "selling_states" &&
          permessions[i] != "tenant_states")
        selecteditems.add(showpermessions[permessions[i]]);
    }
  }

  addemployee(
      {required String token, required addemployeemodel employee}) async {
    emit(Addemployeeloading());
    var result =
        await addemployeerepo.addemployee(token: token, employee: employee);
    result.fold((failure) {
      emit(Addemployeefailure(error_message: failure.error_message));
    }, (succes) {
      emit(Addemployeesuccess(succes_message: succes));
    });
  }

  updateemployee(
      {required String token,
      required int id,
      required addemployeemodel employee}) async {
    emit(updateemployeeloading());
    var result = await addemployeerepo.editemployee(
        token: token, id: id, employee: employee);
    result.fold(
        (l) => {emit(updateemployeefailure(errormessage: l.error_message))},
        (r) => {emit(updateemployeesuccess(succes_message: r))});
  }

  resetdata() {
    selecteditems = [];
    image = null;
    emit(resetdatastate());
  }

  changestatus(String val) {
    this.is_active = val;
    emit(changestatusstate());
  }
}
