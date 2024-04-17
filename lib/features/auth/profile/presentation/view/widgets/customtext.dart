import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtext extends StatelessWidget {
  final String text;
  TextStyle? textStyle15;
  customtext(
      {super.key,
      required this.text,
      this.textStyle15 = Appstyles.textStyle15});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle15,
    );
  }
}
