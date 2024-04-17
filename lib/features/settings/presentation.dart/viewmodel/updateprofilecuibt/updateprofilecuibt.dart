import 'dart:io';

import 'package:ghhg/features/settings/data/models/updateprofilemodel/updateprofilemodel.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodelrequest.dart';
import 'package:ghhg/features/settings/data/repos/upateprofilerepoimp.dart';
import 'package:ghhg/features/settings/presentation.dart/viewmodel/updateprofilecuibt/updateprofilestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class updateprofileCubit extends Cubit<updateprofilestates> {
  final updateprofilerepoimp updateprofilerepo;
  updateprofileCubit(this.updateprofilerepo) : super(updateprofileintial());
  File? image;
  uploadimage() async {
    XFile? pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage!.path);
      emit(changeupdateprofileimage());
    }
  }

  resetimage() {
    image = null;
    emit(changeupdateprofileimage());
  }

  updateprofle(
      {required String token,
      required updateprofilemodelrequest updateprofilemodel}) async {
    emit(updateprofileloading());
    var result = await updateprofilerepo.updateprofilr(
        token: token, updatecompanyprofilemodel: updateprofilemodel);
    result.fold(
        (l) => {emit(updateprofilefailure(error_message: l.error_message))},
        (r) => {emit(updateprofilesuccess(updateprofilemodel: r))});
  }
}
