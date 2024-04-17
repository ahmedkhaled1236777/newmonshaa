import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/desktopmoneyreports.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/mobilemonetreports.dart';
import 'package:flutter/material.dart';

class moneyatreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return moneyatreportsState();
  }
}

class moneyatreportsState extends State<moneyatreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktopmoneyatreports();
      } else {
        return customtableallmobilemoneyatreportss();
      }
    });
  }
}
