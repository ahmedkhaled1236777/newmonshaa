import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/features/auth/login/data/models/loginmodel/loginmodel.dart';
import 'package:ghhg/features/auth/login/data/models/loginrequest.dart';
import 'package:ghhg/features/auth/login/data/repos/loginrepo/loginrepoimplementation.dart';
import 'package:ghhg/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// ignore: camel_case_types
class logincuibt extends Cubit<loginstate> {
  Loginmodel? loginModel;
  int counter = 0;
  changecounter() {
    counter++;
    emit(changercounter());
  }

  final login_repo_implementation loginrepo;
  logincuibt({required this.loginrepo}) : super(logininitial());
  // ignore: non_constant_identifier_names
  Future loginpostdata({required loginrequest login}) async {
    // ignore: unused_local_variable
    emit(loginloading());
    var result = await loginrepo.login(login: login);
    result.fold((failure) {
      emit(loginfailure(error_message: failure.error_message));
    }, (success) {
      loginModel = success;
      emit(loginsucces(loginmodel: success));
    });
  }
  /* getdevicetoken(){
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token){
      cashhelper.setdata(key: "devicetoken", value: token);
  });
  }*/
}
