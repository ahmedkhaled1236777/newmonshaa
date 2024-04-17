import 'package:ghhg/features/notifications/data/models/notificationsmodel/datum.dart';
import 'package:ghhg/features/notifications/data/repos/notificationrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final notificationrepoimplementation notificationsrepo;

  bool loading = false;
  int page = 1;
  List<Datum> mynotifications = [];
  NotificationsCubit({required this.notificationsrepo})
      : super(NotificationsInitial());

  getallmorenotifications({
    required String token,
  }) async {
    page++;
    var result = await notificationsrepo.getnotifications(
      token: token,
      page: page,
    );
    loading = true;
    result.fold((l) {
      emit(Notificationsfailure(error_message: l.error_message));
    }, (r) {
      if (r.data!.links!.next == null) loading = false;
      mynotifications.addAll(r.data!.data!!);

      emit(Notificationssuccess());
    });
  }

  getallnotifications({required String token, required int page}) async {
    this.page = 1;
    emit(Notificationsloading());
    var result = await notificationsrepo.getnotifications(
      token: token,
      page: page,
    );
    loading = true;
    result.fold((l) {
      emit(Notificationsfailure(error_message: l.error_message));
    }, (r) {
      mynotifications.clear();

      mynotifications.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(Notificationssuccess());
    });
  }
}
