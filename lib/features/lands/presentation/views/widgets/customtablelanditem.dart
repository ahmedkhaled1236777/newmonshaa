import 'dart:math';

import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablelanditem extends StatelessWidget {
  final String adress;
  final String priceofmeter;
  final String area;
  final String totalcost;
  final String advertise_type;

  Widget delet;
  Widget edit;
  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablelanditem(
      {super.key,
      required this.adress,
      required this.priceofmeter,
      required this.area,
      required this.totalcost,
      required this.advertise_type,
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
              adress,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 3,
              child: Text(
                priceofmeter,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 3,
              child: Text(
                area,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 3,
              child: Text(
                totalcost,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
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
