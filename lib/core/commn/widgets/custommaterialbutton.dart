import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class custommaterialbutton extends StatelessWidget {
  final void Function()? onPressed;
  // ignore: non_constant_identifier_names
  final String button_name;
  final IconData buttonicon;
  // ignore: non_constant_identifier_names
  const custommaterialbutton(
      {super.key,
      this.onPressed,
      required this.button_name,
      required this.buttonicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.buttoncolor,
          borderRadius: BorderRadius.circular(Appsizes.size5)),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width > 950 ? 20 : 15),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              buttonicon,
              color: Appcolors.whitecolor,
              size: 19,
            ),
            const SizedBox(
              width: Appsizes.size5,
            ),
            Text(
              button_name,
              style:
                  Appstyles.textStyle12.copyWith(color: Appcolors.whitecolor),
            ),
          ],
        ),
      ),
    );
  }
}
