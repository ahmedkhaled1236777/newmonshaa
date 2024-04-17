import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablemoneyatreportsitem extends StatelessWidget {
  final String money;
  final String emoloyeename;
  final String desc;
  final String date;

  TextStyle textStyle;
  double iconsize;

  // ignore: non_constant_identifier_names
  customtablemoneyatreportsitem(
      {required this.money,
      required this.emoloyeename,
      required this.desc,
      required this.date,
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
              emoloyeename,
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
              money,
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
                desc,
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
