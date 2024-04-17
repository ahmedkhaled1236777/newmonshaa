import 'package:ghhg/features/auth/profile/data/model/profilemodel/profilemodel.dart';
import 'package:ghhg/features/auth/profile/data/repo/profilerepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  Profilemodel? profilemodel;
  final profilerepoimplementation profilerepo;
  ProfileCubit(this.profilerepo) : super(ProfileInitial());
  getprofile({required String token}) async {
    emit(Profileloading());
    var result = await profilerepo.getprofile(token: token);
    result.fold((failure) {
      emit(Profilefailure(error_message: failure.error_message));
    }, (success) {
      profilemodel = success;
      emit(Profilesuccess());
    });
  }
}
