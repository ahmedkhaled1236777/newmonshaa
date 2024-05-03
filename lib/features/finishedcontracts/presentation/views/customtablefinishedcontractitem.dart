import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablefinishedcontractsitem extends StatelessWidget {
  final String adress;
  final String ownername;
  final String ownerphone;
  String? tenentname;
  String? tenentphone;
  String? amoutofmoney;
  final String finisheddate;

  TextStyle textStyle;
  double iconsize;
  Widget delet;

  // ignore: non_constant_identifier_names
  customtablefinishedcontractsitem(
      {required this.adress,
      required this.ownername,
      required this.ownerphone,
      this.amoutofmoney,
      this.tenentname,
      this.tenentphone,
      required this.finisheddate,
      this.iconsize = 22,
      required this.delet,
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
                ownerphone,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          if (tenentname != null && MediaQuery.sizeOf(context).width > 950)
            Expanded(
                flex: 3,
                child: Text(
                  tenentname!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          SizedBox(
            width: 3,
          ),
          if (tenentphone != null && MediaQuery.sizeOf(context).width > 950)
            Expanded(
                flex: 3,
                child: Text(
                  tenentphone!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          SizedBox(
            width: 3,
          ),
          if (amoutofmoney != null)
            Expanded(
                flex: 3,
                child: Text(
                  amoutofmoney!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                finisheddate,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(flex: 2, child: delet),
        ],
      ),
    );
  }
}
