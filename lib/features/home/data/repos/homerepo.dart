import 'package:ghhg/core/errors/failure.dart';
import 'package:ghhg/features/home/data/model/homemodel/homemodel.dart';
import 'package:dartz/dartz.dart';

abstract class homerepo {
  Future<Either<failure, Homemodel>> gethome({required String token});
}
