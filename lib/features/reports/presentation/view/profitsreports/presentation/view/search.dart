import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/profitalertcontent.dart';
import 'package:flutter/material.dart';

class profitatsearchreport extends StatefulWidget {
  @override
  State<profitatsearchreport> createState() => _profitatsearchreportState();
}

class _profitatsearchreportState extends State<profitatsearchreport> {
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
                content: profitatalertcontent());
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
