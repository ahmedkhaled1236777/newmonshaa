import 'package:ghhg/features/reciept/presentaion/view/desktopreciept.dart';
import 'package:ghhg/features/reciept/presentaion/view/mobilereciept.dart';
import 'package:flutter/material.dart';

class reciepts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return recieptsState();
  }
}

class recieptsState extends State<reciepts> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopreciepts();
      } else {
        return mobilereciepts();
      }
    });
  }
}
