import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/view/desktopaqaratreport.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/view/mobileaqaratreports.dart';
import 'package:flutter/material.dart';

class aqaratreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return aqaratreportsState();
  }
}

class aqaratreportsState extends State<aqaratreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktopaqaratreports();
      } else {
        return customtableallmobileaqaratreportss();
      }
    });
  }
}
