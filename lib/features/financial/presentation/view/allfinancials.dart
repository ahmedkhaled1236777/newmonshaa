import 'package:ghhg/features/financial/presentation/view/customtableallfinancials.dart';
import 'package:ghhg/features/financial/presentation/view/mobilecustomfinancial.dart';
import 'package:flutter/material.dart';

import '../../data/model/financialmodel/receipt.dart';

class allfinancialsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtableallfinancials();
      } else {
        return customtableallmobilefinancials();
      }
    });
  }
}
