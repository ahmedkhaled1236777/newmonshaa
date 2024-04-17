import 'package:ghhg/features/auth/logout/data/repo/logoutrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final logoutrepoimplementation logoutrepo;
  LogoutCubit({required this.logoutrepo}) : super(LogoutInitial());
  log_out({required String token, required String devicetoken}) async {
    emit(Logoutloading());
    var result =
        await logoutrepo.logout(token: token, devicetoken: devicetoken);
    result.fold((failure) {
      emit(Logoutfailure(error_message: failure.error_message));
    }, (success) {
      emit(Logoutsuccess(success_message: success));
    });
  }
}
