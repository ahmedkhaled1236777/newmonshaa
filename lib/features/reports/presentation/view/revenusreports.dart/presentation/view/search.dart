import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/view/revenusalertcontent.dart';
import 'package:flutter/material.dart';

class revenusatsearchreport extends StatefulWidget {
  @override
  State<revenusatsearchreport> createState() => _revenusatsearchreportState();
}

class _revenusatsearchreportState extends State<revenusatsearchreport> {
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
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ),
                content: revenusatalertcontent());
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
