import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class custommytextform extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureText;
  Widget? suffixIcon;
  String? val;
  TextInputType keyboardType;
  custommytextform(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.val,
      this.keyboardType = TextInputType.none,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return val;
        }
      },
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: Appstyles.textStyle12),
    );
  }
}
