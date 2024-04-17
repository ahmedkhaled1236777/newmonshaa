import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class customimage extends StatelessWidget {
  final double width;
  final double height;
  final String imagename;
  BoxFit? boxfit;
  customimage(
      {super.key,
      required this.width,
      required this.height,
      required this.imagename,
      this.boxfit});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagename,
      fit: boxfit,
      width: width,
      height: height,
    );
  }
}
