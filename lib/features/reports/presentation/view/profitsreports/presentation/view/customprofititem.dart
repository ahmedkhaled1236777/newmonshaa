import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtableprofitatreportsitem extends StatelessWidget {
  final String allexpense;
  final String allrevenus;
  final String profits;
  final String date;

  TextStyle textStyle;
  double iconsize;

  // ignore: non_constant_identifier_names
  customtableprofitatreportsitem(
      {required this.allexpense,
      required this.allrevenus,
      required this.date,
      required this.profits,
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
              allrevenus,
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
                allexpense,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                profits,
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
        ],
      ),
    );
  }
}
