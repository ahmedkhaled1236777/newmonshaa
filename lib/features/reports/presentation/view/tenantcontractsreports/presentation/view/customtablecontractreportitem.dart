import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablecontractsatreportsitem extends StatelessWidget {
  final String adress;
  final String date;
  final String ownername;
  final String totalmoney;

  String? tenantphone;
  String? tenantname;
  String? ownerphone;

  TextStyle textStyle;
  double iconsize;

  // ignore: non_constant_identifier_names
  customtablecontractsatreportsitem(
      {required this.adress,
      required this.totalmoney,
      required this.ownername,
      this.tenantname,
      this.tenantphone,
      required this.ownerphone,
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
                adress,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
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
          if (ownerphone != null)
            SizedBox(
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
          if (tenantname != null)
            SizedBox(
              width: 3,
            ),
          if (tenantname != null)
            Expanded(
                flex: 3,
                child: Text(
                  tenantname!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          if (tenantphone != null)
            SizedBox(
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
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                totalmoney!,
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
