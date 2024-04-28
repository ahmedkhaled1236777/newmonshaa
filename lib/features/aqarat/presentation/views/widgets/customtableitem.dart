import 'dart:math';

import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtableitem extends StatelessWidget {
  final String adress;
  final String section;
  final String price;
  final String type;
  final String advertise_type;

  Widget delet;
  Widget edit;
  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtableitem(
      {super.key,
      required this.adress,
      required this.section,
      required this.price,
      required this.type,
      required this.advertise_type,
      required this.delet,
      required this.edit,
      this.iconsize = 22,
      this.textStyle = Appstyles.textStyle12b});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height / 21),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              adress,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 3,
              child: Text(
                section,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 3,
              child: Text(
                price,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 3,
              child: Text(
                type,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          if (MediaQuery.sizeOf(context).width > 950)
            Expanded(
                flex: 3,
                child: Text(
                  advertise_type,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
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
