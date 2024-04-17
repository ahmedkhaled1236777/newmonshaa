import 'package:ghhg/features/lands/data/models/showlands/datum.dart';
import 'package:ghhg/features/lands/data/repos/showland/showlandrepoimplementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'showlands_state.dart';

class ShowlandsCubit extends Cubit<ShowlandsState> {
  final showlandsrepoimplementation showlands;
  double offset = 0.0;

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  ShowlandsCubit({required this.showlands}) : super(ShowlandsInitial());
  int page = 1;
  bool loading = false;
  getallalands({
    required String token,
    required int page,
  }) async {
    this.page = 1;

    emit(Showlandsloading());
    var result = await showlands.showlands(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Showlandsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(Showlandssuccess());
    });
  }

  getamorelllands({required String token}) async {
    page++;
    var result = await showlands.showlands(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Showlandsfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(Showlandssuccess());
    });
  }

  deleteland({required String token, required int landnumber}) async {
    emit(deletelandsloading());
    var result =
        await showlands.deleteland(token: token, landnumber: landnumber);
    result.fold((failure) {
      emit(deletelandsfailure(error_message: failure.error_message));
    }, (success) {
      data.removeWhere((element) => element.id == landnumber);
      emit(deletelandssuccess(successmessage: success));
    });
  }
}
