import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/addaqar.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addaqarwithscafold extends StatelessWidget {
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
            "تسجيل عقار",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    MediaQuery.sizeOf(context).width > 600 ? 10.sp : 13.5),
          ),
        ),
        drawer: Dashboard(),
        body: Center(
            child: addaqar(
          width: MediaQuery.sizeOf(context).width,
        )),
      ),
    );
  }
}
