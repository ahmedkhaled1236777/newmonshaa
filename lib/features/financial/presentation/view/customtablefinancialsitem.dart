import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablefinancialsitem extends StatelessWidget {
  final String cashnumber;

  final String tenantname;
  String? tenantphone;
  final String amountofmoney;
  String? datefrom;
  String? dateto;
  final String date;

  Widget print;
  Widget delete;

  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablefinancialsitem(
      {super.key,
      required this.cashnumber,
      required this.date,
      this.datefrom,
      this.dateto,
      required this.tenantname,
      this.tenantphone,
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
                tenantname,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            width: 3,
          ),
          if (tenantphone != null)
            Expanded(
                flex: 3,
                child: Text(
                  tenantphone!,
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
