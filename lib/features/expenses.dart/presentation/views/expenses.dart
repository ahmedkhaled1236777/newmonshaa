import 'package:ghhg/features/expenses.dart/presentation/views/desktopexpense.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/mobileexpense.dart';
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return expensesState();
  }
}

class expensesState extends State<expenses> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopexpenses();
      } else {
        return mobileexpenses();
      }
    });
  }
}
