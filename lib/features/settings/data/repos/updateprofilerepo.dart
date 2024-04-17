import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodel/updateprofilemodel.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class updateprofilerepo {
  Future<Either<failure, Updateprofilemodel>> updateprofilr(
      {required String token,
      required updateprofilemodelrequest updatecompanyprofilemodel});
}
