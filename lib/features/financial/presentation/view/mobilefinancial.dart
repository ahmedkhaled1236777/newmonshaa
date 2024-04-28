import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/financial/presentation/view/customtablefinancial.dart';
import 'package:ghhg/features/financial/presentation/view/financialsearch.dart';
import 'package:flutter/material.dart';

class mobilefinancials extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

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
              title: Text(
                'سند القبض',
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    allfinancialsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                  ],
                )
              ],
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtablefinancials(MediaQuery.sizeOf(context).width)
              ],
            )),
      );
    });
  }
}
