import 'dart:async';

import 'package:ghhg/features/connect/data/model/connectmodelrequest.dart';
import 'package:ghhg/features/connect/data/repo/connectrepoimp.dart';
import 'package:ghhg/features/connect/presentation/viewmodel/connect/connectstate.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class connectCubit extends Cubit<connectState> {
  final connectrepoimplementation connectrepo;
  connectCubit(this.connectrepo) : super(ConnectStateiniti());
  addmessage(
      {required String token, required connectmodelrequest connect}) async {
    emit(ConnectStateloading());
    var result = await connectrepo.addmessage(token: token, connect: connect);
    result.fold(
        (l) => {emit(ConnectStatefailure(error_message: l.error_message))},
        (r) => {emit(ConnectStatesuccess(success_message: r))});
  }
}
