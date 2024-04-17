import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/repos/editaqar/editaqarrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final editaqarrepoimplementation editrepo;
  EditCubit({required this.editrepo}) : super(EditInitial());
  String? aqartype;
  String? departement;
  String? advistor_type;
  changeaddaqartype(String val) {
    aqartype = val;
    emit(editchangetype());
  }

  changeaddaqardepartement(String val) {
    departement = val;
    emit(editchangedepartement());
  }

  changeaddaqaradvistortype(String val) {
    advistor_type = val;
    emit(editchangeadvistortype());
  }

  updateaqar(
      {required String token,
      required int id,
      required addaqarrequest add_aqar}) async {
    emit(editloading());
    var result =
        await editrepo.editaqar(token: token, id: id, add_aqar: add_aqar);
    result.fold((failure) {
      emit(editfailure(error_message: failure.error_message));
    }, (success) {
      emit(editsuccess(successmessage: success));
    });
  }
}
