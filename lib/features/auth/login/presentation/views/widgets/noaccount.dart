import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class noaccount extends StatelessWidget {
  final String maintext;
  final String buttontext;
  // ignore: non_constant_identifier_names
  final Widget navigated_widget;

  // ignore: non_constant_identifier_names
  const noaccount(
      {super.key,
      required this.maintext,
      required this.buttontext,
      required this.navigated_widget});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(maintext, style: Appstyles.textstle13),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return navigated_widget;
                }));
              },
              child: Text(
                buttontext,
                style: Appstyles.textstle13,
              )),
        ],
      ),
    );
  }
}
