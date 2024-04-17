import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablelandatreportsitem extends StatelessWidget {
  final String emoloyeename;
  final String adress;
  final String area;
  final String priceofmeter;
  final String date;

  String? amoutofmoney;

  String? phone;
  String? advertiser;
  String? advertisertype;

  TextStyle textStyle;
  double iconsize;

  // ignore: non_constant_identifier_names
  customtablelandatreportsitem(
      {required this.adress,
      required this.emoloyeename,
      required this.priceofmeter,
      this.advertiser,
      this.amoutofmoney,
      this.advertisertype,
      required this.area,
      this.phone,
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
                area,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                priceofmeter!,
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
