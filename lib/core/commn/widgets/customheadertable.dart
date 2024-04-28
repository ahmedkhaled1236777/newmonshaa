import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customheadertable extends StatelessWidget {
  int flex;
  String? tabletormobile;
  final String title;
  final TextStyle textStyle;
  customheadertable(
      {this.flex = 3,
      required this.title,
      this.tabletormobile,
      required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
