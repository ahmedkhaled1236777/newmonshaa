import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/desktoplands.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/mobilelandsreport.dart';
import 'package:flutter/material.dart';

class landatreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return landatreportsState();
  }
}

class landatreportsState extends State<landatreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktoplandatreports();
      } else {
        return customtableallmobilelandatreportss();
      }
    });
  }
}
