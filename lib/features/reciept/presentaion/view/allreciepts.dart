import 'package:ghhg/features/reciept/presentaion/view/cuatomtableallreciepts.dart';
import 'package:ghhg/features/reciept/presentaion/view/mobilecustomreciept.dart';
import 'package:flutter/material.dart';

import '../../data/models/allrecieptmodel/receipt.dart';

class allreciepts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtableallreciepts();
      } else {
        return customtableallmobilereciepts();
      }
    });
  }
}
