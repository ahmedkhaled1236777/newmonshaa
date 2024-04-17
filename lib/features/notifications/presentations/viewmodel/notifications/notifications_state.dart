part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class Notificationsloading extends NotificationsState {}

class Notificationssuccess extends NotificationsState {}

class Notificationsfailure extends NotificationsState {
  final String error_message;

  Notificationsfailure({required this.error_message});
}
