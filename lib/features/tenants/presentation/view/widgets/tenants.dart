import 'package:ghhg/features/tenants/presentation/view/widgets/desktoptenants.dart';
import 'package:ghhg/features/tenants/presentation/view/widgets/mobiletenants.dart';
import 'package:flutter/material.dart';

class Tenants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TenantsState();
  }
}

class TenantsState extends State<Tenants> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'اضغط لاختيار تاريخ محدد';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoptenents();
      } else {
        return mobiletenants();
      }
    });
  }
}
