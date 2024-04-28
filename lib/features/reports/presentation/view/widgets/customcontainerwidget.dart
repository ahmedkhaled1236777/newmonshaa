import 'package:ghhg/core/commn/navigation.dart';
import 'package:flutter/material.dart';

class customcontainer extends StatelessWidget {
  final Widget page;
  final String name;
  final String mobileordesktop;

  const customcontainer(
      {super.key,
      required this.page,
      required this.name,
      required this.mobileordesktop});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateto(navigationscreen: page, context: context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: mobileordesktop == "mobile"
                ? const Color(0xff5D8AA8)
                : Colors.blueGrey),
        padding: const EdgeInsets.symmetric(vertical: 13),
        width: mobileordesktop == "mobile"
            ? MediaQuery.of(context).size.width * 0.9
            : MediaQuery.of(context).size.width * 0.35,
        child: Text(name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12.5,
                color: Colors.white,
                fontWeight: FontWeight.w100)),
      ),
    );
  }
}
