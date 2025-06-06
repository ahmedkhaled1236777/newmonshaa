import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class custommytextform extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureText;
  Widget? suffixIcon;
  String? val;
  TextInputType keyboardType;
  int? maxlines;
  bool? readonly;
  String? suffixtext;
  List<TextInputFormatter>? inputFormatters;
  custommytextform(
      {super.key,
      this.readonly = false,
      this.inputFormatters,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.maxlines = 1,
      this.val,
      this.suffixtext,
      this.keyboardType = TextInputType.text,
      this.suffixIcon});

  @override
  State<custommytextform> createState() => _custommytextformState();
}

class _custommytextformState extends State<custommytextform> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 950
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.hintText,
                style: TextStyle(fontSize: 12.5, color: Colors.black54),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: widget.inputFormatters,
                style: TextStyle(fontSize: 13),
                validator: (value) {
                  if (value!.isEmpty) {
                    return widget.val;
                  }
                },
                obscureText: widget.obscureText,
                readOnly: widget.readonly!,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxlines,
                controller: widget.controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff2BA4C8), width: 0.5)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 7, vertical: 17),
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff2BA4C8), width: 0.5)),
                    suffixText: widget.suffixtext,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Appsizes.size5),
                        borderSide: const BorderSide(
                            color: Appcolors.bluecolor, width: 0.5)),
                    suffixIcon: widget.suffixIcon,
                    hintStyle: Appstyles.textStyle12),
              ),
              SizedBox(
                height: 5,
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.hintText,
                style: TextStyle(fontSize: 12.5, color: Colors.black54),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: widget.inputFormatters,
                style: TextStyle(fontSize: 13),
                validator: (value) {
                  if (value!.isEmpty) {
                    return widget.val;
                  }
                },
                obscureText: widget.obscureText,
                readOnly: widget.readonly!,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxlines,
                controller: widget.controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff2BA4C8), width: 0.5)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff2BA4C8), width: 0.5)),
                    suffixText: widget.suffixtext,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Appsizes.size5),
                        borderSide: const BorderSide(
                            color: Appcolors.bluecolor, width: 0.5)),
                    suffixIcon: widget.suffixIcon,
                    hintStyle: Appstyles.textStyle12),
              ),
              SizedBox(
                height: 5,
              )
            ],
          );
  }
}
