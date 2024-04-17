import 'package:ghhg/features/financial/presentation/view/desktopfinancial.dart';
import 'package:ghhg/features/financial/presentation/view/mobilefinancial.dart';
import 'package:flutter/material.dart';

class financials extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return financialsState();
  }
}

class financialsState extends State<financials> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopfinancials();
      } else {
        return mobilefinancials();
      }
    });
  }
}
