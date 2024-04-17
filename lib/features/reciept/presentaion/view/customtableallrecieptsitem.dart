import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablerecieptsitem extends StatelessWidget {
  final String cashnumber;

  final String ownername;
  String? ownerphone;
  final String amountofmoney;
  String? datefrom;
  String? dateto;
  final String date;

  Widget print;
  Widget delete;

  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablerecieptsitem(
      {super.key,
      required this.cashnumber,
      required this.date,
      this.datefrom,
      this.dateto,
      required this.ownername,
      this.ownerphone,
      required this.amountofmoney,
      required this.print,
      required this.delete,
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
            flex: 2,
            child: Text(
              cashnumber,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                ownername,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            width: 3,
          ),
          if (ownerphone != null)
            Expanded(
                flex: 3,
                child: Text(
                  ownerphone!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                amountofmoney,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            width: 3,
          ),
          if (datefrom != null)
            Expanded(
                flex: 3,
                child: Text(
                  datefrom!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            width: 3,
          ),
          if (dateto != null)
            Expanded(
                flex: 3,
                child: Text(
                  dateto!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                date,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            flex: 2,
            child: print,
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            flex: 2,
            child: delete,
          ),
        ],
      ),
    );
  }
}
