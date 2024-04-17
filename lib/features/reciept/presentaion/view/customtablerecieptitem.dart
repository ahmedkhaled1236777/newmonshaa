import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablerecieptitem extends StatelessWidget {
  final String tenantname;
  final String ownername;
  final String aqaradress;
  final String amountofmoney;

  Widget addreciept;

  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablerecieptitem(
      {super.key,
      required this.tenantname,
      required this.ownername,
      required this.aqaradress,
      required this.amountofmoney,
      required this.addreciept,
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
              tenantname,
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
                ownername,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                aqaradress,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                amountofmoney,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: addreciept,
            flex: 2,
          ),
        ],
      ),
    );
  }
}
