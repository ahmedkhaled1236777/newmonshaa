import 'package:ghhg/features/clients/data/model/clientmodelrequest.dart';
import 'package:ghhg/features/clients/data/repos/clientrepoimplementation.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/clientmodel/datum.dart';

class clientsCubit extends Cubit<clientsState> {
  final clientsrepoimplementation clientsrepo;
  clientsCubit(this.clientsrepo) : super(clientsInitial());
  List<String> headertabel = [
    "اسم العميل",
    "رقم الهاتف",
    "الحاله",
    "تعديل",
    "حذف",
  ];
  Map showdepartement = {
    "state_sale": "عقار بيع",
    "state_rent": "عقار ايجار",
    "land_sale": "ارض بيع"
  };
  Map<String, dynamic>? queryParameters;
  List<Datum> clientsdata = [];
  bool loading = false;
  int page = 1;
  String? status;
  String? clienttype;
  String? departement;
  changestatus(String val) {
    status = val;
    emit(changestatusstate());
  }
  changeclienttype(String val) {
    clienttype = val;
    emit(changestatusstate());
  }

  changedepartement(String val) {
    departement = val;
    emit(changestatusstate());
  }

  cleardata() {
    departement = null;
    status = null;
    clienttype = null;
    emit(changestatusstate());
  }

  addclients(
      {required String token, required clientmodelrequest clients}) async {
    emit(Addclientsloading());
    var result = await clientsrepo.addclients(token: token, clients: clients);
    result.fold((failure) {
      emit(Addclientsfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addclientssuccess(success_message: success));
    });
  }

  getallmoreclientss({
    required String token,
  }) async {
    page++;
    var result = await clientsrepo.getclientss(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showclientsfailure(errorr_message: l.error_message));
    }, (r) {
      clientsdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showclientssuccess());
    });
  }

  getallclientss({required String token, required int page}) async {
    print("pppppppppppppppppppppppppppppppppppppp");
    print(queryParameters);
    this.page = 1;
    emit(showclientsloadin());
    var result = await clientsrepo.getclientss(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showclientsfailure(errorr_message: l.error_message));
    }, (r) {
      clientsdata.clear();

      clientsdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showclientssuccess());
    });
  }

  deleteclients({required String token, required int clientsid}) async {
    emit(deleteclientsloading());
    var result =
        await clientsrepo.deleteclients(token: token, clientsid: clientsid);
    result.fold((failure) {
      emit(deleteclientsfailure(errormessage: failure.error_message));
    }, (success) {
      clientsdata.removeWhere((element) => element.id == clientsid);
      emit(deleteclientssuccess(successmessage: success));
    });
  }

  updateclients(
      {required String token,
      required int id,
      required clientmodelrequest clientsmodel}) async {
    emit(editclientsloading());
    var result = await clientsrepo.editclients(
        token: token, id: id, clientsmodel: clientsmodel);
    result.fold((failure) {
      emit(editclientsfailure(error_message: failure.error_message));
    }, (success) {
      emit(editclientssuccess(success_message: success));
    });
  }
}
