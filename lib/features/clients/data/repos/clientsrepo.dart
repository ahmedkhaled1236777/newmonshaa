import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/clients/data/model/clientmodel/clientmodel.dart';
import 'package:ghhg/features/clients/data/model/clientmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class clientsrepo {
  Future<Either<failure, String>> addclients(
      {required String token, required clientmodelrequest clients});
  Future<Either<failure, Clientmodel>> getclientss(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteclients(
      {required String token, required int clientsid});
  Future<Either<failure, String>> editclients(
      {required String token,
      required int id,
      required clientmodelrequest clientsmodel});
}
