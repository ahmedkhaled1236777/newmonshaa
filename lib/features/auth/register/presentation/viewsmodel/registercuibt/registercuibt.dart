import 'package:ghhg/features/auth/register/data/models/registermodelrequest.dart';
import 'package:ghhg/features/auth/register/data/repos/registerrepoimplementation.dart';
import 'package:ghhg/features/auth/register/presentation/viewsmodel/registercuibt/registerstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class registercuibt extends Cubit<registerstate> {
  final registerrepoimplementation registerrepo;
  registercuibt({required this.registerrepo}) : super(registerinitaial());
  register({required registerrequest registerrequest}) async {
    emit(registerloading());
    var result = await registerrepo.register(registerrequest: registerrequest);
    result.fold((failure) {
      emit(registerfailure(error_message: failure.error_message));
    }, (success) {
      emit(registersuccess(registermodel: success));
    });
  }
}
