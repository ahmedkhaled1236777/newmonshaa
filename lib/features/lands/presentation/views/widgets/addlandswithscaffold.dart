import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/addland.dart';
import 'package:flutter/material.dart';

class addlandwithscafold extends StatelessWidget {
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
            "تسجيل الاراضي",
            style:
                TextStyle(color: Colors.white, fontSize: Appsizes.mappBarsize),
          ),
        ),
        body: Center(
            child: addland(
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
