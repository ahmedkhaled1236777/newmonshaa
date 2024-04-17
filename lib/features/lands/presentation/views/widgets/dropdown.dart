import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:flutter/material.dart';

class dropdownbutton extends StatelessWidget {
  final Function onchanged;
  String? name;
  final List items;
  final String hint;

  dropdownbutton(
      {super.key,
      required this.onchanged,
      required this.items,
      required this.name,
      required this.hint});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Appcolors.bluecolor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton(
                padding: EdgeInsets.only(right: 7),
                isExpanded: true,
                underline: Text(""),
                borderRadius: BorderRadius.circular(30),
                value: name,
                hint: Text(
                  hint,
                  style: Appstyles.textStyle12,
                  textAlign: TextAlign.center,
                ),
                items: items
                    .map((e) => DropdownMenuItem(
                          child: Center(
                              child: Text("${e}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Alexanderia"))),
                          value: e,
                        ))
                    .toList(),
                onChanged: ((val) {
                  onchanged(val);
                })),
          ),
        ],
      ),
    );
  }
}
