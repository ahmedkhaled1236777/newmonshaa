import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/view/desktoprevenus.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/view/mobilerevenusreports.dart';
import 'package:flutter/material.dart';

class revenusatreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return revenusatreportsState();
  }
}

class revenusatreportsState extends State<revenusatreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktoprevenusatreports();
      } else {
        return customtableallmobilerevenusatreportss();
      }
    });
  }
}
