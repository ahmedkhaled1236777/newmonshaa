import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/employeecomission/presentation/view/desktopemployeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/view/mobileemployeecom.dart';

class employeecoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeecomsState();
  }
}

class employeecomsState extends State<employeecoms> {
  @override
  void initState() {
    if (BlocProvider.of<addaqarcuibt>(context).allemployeesmodel == null)
      BlocProvider.of<addaqarcuibt>(context)
          .getallemployees(token: generaltoken);
          print("jhbjhjhukikjijijiojijiijiiioioj");
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopemployeecoms();
      } else {
        return mobileemployeecoms();
      }
    });
  }
}
