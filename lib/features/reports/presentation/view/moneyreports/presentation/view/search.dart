import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/moneyalertcontent.dart';
import 'package:flutter/material.dart';

class moneyatsearchreport extends StatefulWidget {
  @override
  State<moneyatsearchreport> createState() => _moneyatsearchreportState();
}

class _moneyatsearchreportState extends State<moneyatsearchreport> {
  @override
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
                        BlocProvider.of<DateCubit>(context).cleardates();

                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ),
                content: moneyatalertcontent());
          },
        );
      },
      child: const Icon(
        Icons.search,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
