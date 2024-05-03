import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/tenants/presentation/view/widgets/customaddtenant.dart';
import 'package:flutter/material.dart';

class addtenantwithscafold extends StatelessWidget {
  GlobalKey<FormState> foemkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Appcolors.maincolor,
          centerTitle: true,
          title: Text(
            "تسجيل المستأجرين",
            style:
                TextStyle(color: Colors.white, fontSize: Appsizes.mappBarsize),
          ),
        ),
        body: Center(
            child: addtenant(
          formkey: foemkey,
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
