import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtableaqaratreportsitem extends StatelessWidget {
  final String emoloyeename;
  final String adress;
  String? amoutofmoney;
  final String departement;
  final String date;
  final String type;

  String? phone;
  String? advertiser;
  String? advertisertype;
  String? area;

  TextStyle textStyle;
  double iconsize;

  // ignore: non_constant_identifier_names
  customtableaqaratreportsitem(
      {required this.adress,
      required this.emoloyeename,
      this.advertiser,
      this.amoutofmoney,
      required this.type,
      this.advertisertype,
      this.area,
      this.phone,
      required this.date,
      required this.departement,
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
                departement,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          if (amoutofmoney != null)
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
                type!,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          if (advertiser != null)
            SizedBox(
              width: 3,
            ),
          if (advertiser != null)
            Expanded(
                flex: 3,
                child: Text(
                  advertiser!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          if (phone != null)
            SizedBox(
              width: 3,
            ),
          if (phone != null)
            Expanded(
                flex: 3,
                child: Text(
                  phone!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          if (advertisertype != null)
            SizedBox(
              width: 3,
            ),
          if (advertisertype != null)
            Expanded(
                flex: 3,
                child: Text(
                  advertisertype!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                )),
          if (area != null)
            SizedBox(
              width: 3,
            ),
          if (area != null)
            Expanded(
                flex: 3,
                child: Text(
                  area!,
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
