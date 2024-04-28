import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/contractcontentreport.dart';
import 'package:flutter/material.dart';

class contractsatsearchreport extends StatefulWidget {
  @override
  State<contractsatsearchreport> createState() =>
      _contractsatsearchreportState();
}

class _contractsatsearchreportState extends State<contractsatsearchreport> {
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
                content: contractsatalertcontent());
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
