import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:flutter/material.dart';

showsnack({required String comment, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.1),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Appsizes.size20)),
    content: Center(child: Text(comment)),
  ));
}

String generaltoken = cashhelper.getdata(key: "token");
