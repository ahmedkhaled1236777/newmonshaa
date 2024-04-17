import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/addaqar.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/addland.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addlandwithscafold extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scafoldstate,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scafoldstate.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          backgroundColor: Appcolors.maincolor,
          centerTitle: true,
          title: Text(
            "تسجيل الاراضي",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    Appsizes.mappBarsize),
          ),
        ),
        drawer: Dashboard(),
        body: Center(
            child: addland(
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
