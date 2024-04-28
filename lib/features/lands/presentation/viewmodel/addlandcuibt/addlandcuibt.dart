import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/data/repos/addland/addlandrepoimplementation.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandstate.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class addlandcuibt extends Cubit<addlandstate> {
  final addlandrepoimplementation addlandrepo;
  addlandcuibt({required this.addlandrepo}) : super(addlandintial());
  List<XFile> imageFile = [];
  List? images = [];
  String? advistor_type;
  List headertable = [
    "العنوان",
    "سعر المتر",
    "المساحه",
    "التكلفه",
    "نوع المعلن",
    "تعديل",
    "حذف"
  ];

  changeaddaqaradvistortype(String val) {
    advistor_type = val;
    emit(changeadvistortypeland());
  }

  addnewimage({required List<XFile> pickedimages}) {
    imageFile.addAll(pickedimages);
    emit(addnewimagestateland());
  }

  uploadimages() async {
    for (int i = 0; i < imageFile.length; i++) {
      images!.add(await MultipartFile.fromFile(imageFile[i].path,
          filename: imageFile[i].path.split("/").last));
    }
  }

  removeimage(int index) {
    imageFile.removeWhere((element) => element == imageFile[index]);
    emit(addnewimagestateland());
  }

  addland(
      {required addlandrequest myaddaqarrequest, required String token}) async {
    emit(addlandloading());
    var result = await addlandrepo.addland(
        addlandrequest: myaddaqarrequest, token: token);
    result.fold((failure) {
      emit(addlandfailure(error: failure.error_message));
    }, (success) {
      emit(addlandsuccess(successmessage: success));
    });
  }

  cleardata() {
    advistor_type = null;
    imageFile = [];
    images = [];
    emit(changeadvistortypeland());
  }
}
