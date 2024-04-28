import 'package:ghhg/features/finishedcontracts/presentation/views/customtablefinishedcontracts.dart';
import 'package:ghhg/features/finishedcontracts/presentation/views/cutsomtablemobilefinshedcontracts.dart';
import 'package:flutter/material.dart';

class finishedcontracts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return finishedcontractsState();
  }
}

class finishedcontractsState extends State<finishedcontracts> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtableallfinishedcontracts();
      } else {
        return customtableallmobilefinishedcontractss();
      }
    });
  }
}
