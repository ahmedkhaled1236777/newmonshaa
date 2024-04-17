import 'package:ghhg/features/revenus/presentation/views/desktoprevenu.dart';
import 'package:ghhg/features/revenus/presentation/views/mobilerevenue.dart';
import 'package:flutter/material.dart';

class revenues extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return revenuesState();
  }
}

class revenuesState extends State<revenues> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoprevenues();
      } else {
        return mobilerevenues();
      }
    });
  }
}
