import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/desktopprofits.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/mobileprofits.dart';
import 'package:flutter/material.dart';

class profitatreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return profitatreportsState();
  }
}

class profitatreportsState extends State<profitatreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktopprofitatreports();
      } else {
        return customtableallmobileprofitatreportss();
      }
    });
  }
}
