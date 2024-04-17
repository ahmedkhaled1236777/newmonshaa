import 'package:ghhg/features/reports/presentation/view/widgets/customreports.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReportsState();
  }
}

class ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customreports(
          devicetype: "desktop",
        );
      } else {
        return customreports(
          devicetype: "mobile",
        );
      }
    });
  }
}
