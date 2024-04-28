import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class customtextform extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixicon;
  final String hintText;
  bool obscureText;
  Widget? suffixIcon;
  String? val;
    TextInputType keyboardType;

List<TextInputFormatter>? inputFormatters;
  customtextform(
      {super.key,
      this.keyboardType=TextInputType.text,
      this.inputFormatters,
      required this.controller,
      required this.prefixicon,
      required this.hintText,
      this.obscureText = false,
      this.val,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
       inputFormatters:inputFormatters,
      validator: (value) {
        if (value!.isEmpty) {
          return val;
        }
      },
      obscureText: obscureText,
      style: TextStyle(fontSize: 12.5),
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          prefixIcon: Icon(
            prefixicon,
            size: Appsizes.size20,
            color: Appcolors.blackcolor,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide: BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: Appstyles.textStyle12),
    );
  }
}
