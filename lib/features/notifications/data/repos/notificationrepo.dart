import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/notifications/data/models/notificationsmodel/notificationsmodel.dart';
import 'package:dartz/dartz.dart';

abstract class notificationsrepo {
  Future<Either<failure, Notificationsmodel>> getnotifications(
      {required String token, required int page});
}
