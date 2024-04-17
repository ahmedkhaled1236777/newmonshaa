abstract class addaqarstate {}

class addaaqarintial extends addaqarstate {}

class changedepartement extends addaqarstate {}

class changeadvistortype extends addaqarstate {}

class changetype extends addaqarstate {}

class getallemployeessuccess extends addaqarstate {}

class getallemployeesfailure extends addaqarstate {
  final String error_message;

  getallemployeesfailure({required this.error_message});
}

class addnewimagestate extends addaqarstate {}

class addchangeemployeename extends addaqarstate {}

class addaaqarloading extends addaqarstate {}

class addaaqarsuccess extends addaqarstate {
  final String successmessage;

  addaaqarsuccess({required this.successmessage});
}

class addaaqarfailure extends addaqarstate {
  final String error;

  addaaqarfailure({required this.error});
}
