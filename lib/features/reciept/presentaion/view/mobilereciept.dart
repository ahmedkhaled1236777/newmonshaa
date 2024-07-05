import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/reciept/presentaion/view/customtablereciept.dart';
import 'package:ghhg/features/reciept/presentaion/view/recieptsearch.dart';
import 'package:flutter/material.dart';

class mobilereciepts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Color(0xff415769),
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: const Text(
                'سند الصرف',
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    allrecieptsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                  ],
                )
              ],
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customtablereciepts(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
