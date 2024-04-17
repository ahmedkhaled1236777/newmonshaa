abstract class addlandstate {}

class addlandintial extends addlandstate {}

class changeadvistortypeland extends addlandstate {}

class addnewimagestateland extends addlandstate {}

class addlandloading extends addlandstate {}

class addlandsuccess extends addlandstate {
  final String successmessage;

  addlandsuccess({required this.successmessage});
}

class addlandfailure extends addlandstate {
  final String error;

  addlandfailure({required this.error});
}
