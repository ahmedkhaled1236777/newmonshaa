import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/alertcontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  void initState() {
    if (BlocProvider.of<addaqarcuibt>(context).allemployeesmodel == null)
      BlocProvider.of<addaqarcuibt>(context)
          .getallemployees(token: generaltoken);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,

          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                title: Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<addaqarcuibt>(context).cleardata();

                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                      )),
                ),
                content: alertcontent());
          },
        );
      },
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
