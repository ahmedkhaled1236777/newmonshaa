import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/financial/presentation/view/addfinancial.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addfinancialwithscafold extends StatelessWidget {
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
            "سند قبض",
            style:
                TextStyle(color: Colors.white, fontSize: Appsizes.mappBarsize),
          ),
        ),
        body: Center(
            child: addfinancial(
          formkey: foemkey,
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
