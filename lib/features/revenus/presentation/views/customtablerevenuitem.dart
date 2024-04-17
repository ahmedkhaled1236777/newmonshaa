import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablerevenueitem extends StatelessWidget {
  final String amount;
  final String descrip;
  final String date;

  Widget delet;
  Widget edit;
  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablerevenueitem(
      {super.key,
      required this.amount,
      required this.descrip,
      required this.date,
      required this.delet,
      required this.edit,
      this.iconsize = 22,
      this.textStyle = Appstyles.textStyle12b});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height / 19),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              amount,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                descrip,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                date,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: edit,
            flex: 2,
          ),
          Expanded(
            child: delet,
            flex: 2,
          ),
        ],
      ),
    );
  }
}
