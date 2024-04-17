import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/repos/editaqar/editaqarrepoimplementation.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/data/repos/editland/editlandrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_state.dart';

class EditlandCubit extends Cubit<EditlandState> {
  final editlandrepoimplementation editrepo;
  EditlandCubit({required this.editrepo}) : super(EditlandInitial());
  String? advistor_type;

  changeaddlandadvistortype(String val) {
    print("++++++++++++++++++++++++++++++");
    print(val);
    advistor_type = val;
    emit(editlandchangeadvistortype());
  }

  updateland(
      {required String token,
      required int id,
      required addlandrequest add_land}) async {
    emit(editlandloading());
    var result =
        await editrepo.editland(token: token, id: id, add_land: add_land);
    result.fold((failure) {
      emit(editlandfailure(error_message: failure.error_message));
    }, (success) {
      emit(editlandsuccess(successmessage: success));
    });
  }
}
