import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/clients/presentation/view/addclients.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addclientswithscafold extends StatelessWidget {
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
            "تسجيل العملاء",
            style:
                TextStyle(color: Colors.white, fontSize: Appsizes.mappBarsize),
          ),
        ),
        body: Center(
            child: addclients(
          formkey: foemkey,
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
