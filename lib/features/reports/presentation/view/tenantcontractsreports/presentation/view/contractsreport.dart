import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/desktopcontractsreport.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/mobilecontractsreports.dart';
import 'package:flutter/material.dart';

class contractsatreports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return contractsatreportsState();
  }
}

class contractsatreportsState extends State<contractsatreports> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtabledesktopcontractsatreports();
      } else {
        return customtableallmobilecontractsatreportss();
      }
    });
  }
}
