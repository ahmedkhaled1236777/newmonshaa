import 'package:ghhg/features/settings/data/models/updateprofilemodel/updateprofilemodel.dart';

abstract class updateprofilestates {}

class updateprofileintial extends updateprofilestates {}

class updateprofileloading extends updateprofilestates {}

class changeupdateprofileimage extends updateprofilestates {}

class updateprofilesuccess extends updateprofilestates {
  final Updateprofilemodel updateprofilemodel;

  updateprofilesuccess({required this.updateprofilemodel});
}

class updateprofilefailure extends updateprofilestates {
  final String error_message;

  updateprofilefailure({required this.error_message});
}
